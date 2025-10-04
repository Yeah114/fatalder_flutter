import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import '../generated/fatalder.pbgrpc.dart';

class GrpcService {
  static final GrpcService _instance = GrpcService._internal();
  factory GrpcService() => _instance;
  GrpcService._internal();

  ClientChannel? _channel;
  FatalderServiceClient? _client;
  Process? _serverProcess;
  IOSink? _logSink;
  String? _logFilePath;
  StreamSubscription<String>? _stdoutSubscription;
  StreamSubscription<String>? _stderrSubscription;

  // Android 上使用 127.0.0.1 更可靠，其他平台使用 localhost
  String? _customHost;
  String get _host =>
      _customHost ?? (Platform.isAndroid ? '127.0.0.1' : 'localhost');
  int _port = 12465; // 默认起始端口改为 12465

  FatalderServiceClient get client {
    if (_client == null) {
      throw Exception('gRPC client not initialized. Call connect() first.');
    }
    return _client!;
  }

  bool get isConnected => _client != null;
  int get currentPort => _port;

  /// 检查端口是否可用（仅用于非 Android 平台）
  Future<bool> _isPortAvailable(int port) async {
    if (Platform.isAndroid) {
      // Android 上不进行端口扫描，直接返回 true
      return true;
    }

    try {
      final ServerSocket socket = await ServerSocket.bind(
        InternetAddress.loopbackIPv4,
        port,
      );
      await socket.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 查找可用端口
  Future<int> _findAvailablePort() async {
    if (Platform.isAndroid) {
      // Android 上直接使用固定端口，不进行扫描
      print('🤖 Android: Using fixed port 12465');
      return 12465;
    }

    // 其他平台进行端口扫描
    int port = 12465;
    while (port < 12565) {
      // 最多尝试 100 个端口
      if (await _isPortAvailable(port)) {
        print('Found available port: $port');
        return port;
      }
      print('Port $port is in use, trying next...');
      port++;
    }
    throw Exception('No available port found in range 12465-12564');
  }

  /// 获取 gRPC 二进制文件路径
  Future<String> _getGrpcBinaryPath() async {
    // 根据平台和架构选择二进制文件名
    // 命名规则：fatalder_grpc_系统_架构
    String binaryName;
    if (Platform.isAndroid) {
      // Android 统一使用 ARM64
      binaryName = 'fatalder_grpc_android_arm64';
    } else if (Platform.isLinux) {
      // Linux 默认使用 AMD64
      binaryName = 'fatalder_grpc_linux_amd64';
    } else if (Platform.isWindows) {
      binaryName = 'fatalder_grpc_windows_amd64.exe';
    } else if (Platform.isMacOS) {
      binaryName = 'fatalder_grpc_darwin_amd64';
    } else {
      throw Exception('Unsupported platform: ${Platform.operatingSystem}');
    }

    // 1. 在开发环境，直接使用项目目录的 assets
    final String devBinary = '${Directory.current.path}/assets/$binaryName';
    if (await File(devBinary).exists()) {
      print('Using dev binary: $devBinary');
      // 确保有执行权限
      if (!Platform.isWindows) {
        try {
          final result = await Process.run('chmod', ['755', devBinary]);
          if (result.exitCode == 0) {
            print('✅ Dev binary has execute permission');
          }
        } catch (e) {
          print('⚠️ chmod warning for dev binary: $e');
        }
      }
      return devBinary;
    }

    // 2. 在发布环境，从 assets 复制到应用数据目录
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String targetBinary = '${appDocDir.path}/$binaryName';

    // 检查目标文件是否已存在
    if (await File(targetBinary).exists()) {
      print('Binary already exists in app directory: $targetBinary');
      return targetBinary;
    }

    // 从 Flutter assets 读取二进制文件
    try {
      print('Loading binary from assets: assets/$binaryName');
      final ByteData data = await rootBundle.load('assets/$binaryName');
      final List<int> bytes = data.buffer.asUint8List();

      // 写入到应用数据目录
      final File targetFile = File(targetBinary);
      await targetFile.writeAsBytes(bytes, mode: FileMode.write, flush: true);
      print('Binary copied to: $targetBinary (${bytes.length} bytes)');

      // 设置执行权限
      if (!Platform.isWindows) {
        try {
          // Android 也需要 chmod +x
          final result = await Process.run('chmod', ['755', targetBinary]);
          if (result.exitCode == 0) {
            print('✅ Execution permission granted (chmod 755)');
          } else {
            print('⚠️ chmod returned ${result.exitCode}: ${result.stderr}');
            // 在 Android 上尝试另一种方式
            if (Platform.isAndroid) {
              final result2 = await Process.run('sh', [
                '-c',
                'chmod 755 $targetBinary',
              ]);
              if (result2.exitCode == 0) {
                print('✅ Execution permission granted via sh');
              } else {
                print('❌ Failed to set execute permission: ${result2.stderr}');
              }
            }
          }
        } catch (e) {
          print('❌ Failed to set execute permission: $e');
          rethrow;
        }
      }

      return targetBinary;
    } catch (e) {
      throw Exception(
        'Failed to load gRPC binary ($binaryName) from assets: $e',
      );
    }
  }

  Future<File> _resolveLogFile() async {
    if (Platform.isAndroid) {
      final externalLog = File('/sdcard/fatalder_grpc.log');
      try {
        await externalLog.parent.create(recursive: true);
        if (!await externalLog.exists()) {
          await externalLog.create(recursive: true);
        }
        return externalLog;
      } catch (e) {
        print('⚠️ 无法使用 /sdcard 保存日志，将回退到应用目录: $e');
      }
    }

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final fallback = File('${appDocDir.path}/fatalder_grpc.log');
    await fallback.parent.create(recursive: true);
    if (!await fallback.exists()) {
      await fallback.create(recursive: true);
    }
    return fallback;
  }

  Future<void> _ensureLogSink() async {
    if (_logSink != null) {
      return;
    }

    final logFile = await _resolveLogFile();
    _logFilePath = logFile.path;
    _logSink = logFile.openWrite(mode: FileMode.append);
    _logSink!.writeln(
      '\n===== gRPC 日志会话启动于 ${DateTime.now().toIso8601String()} =====',
    );
    print('📝 gRPC 日志路径: $_logFilePath');
  }

  void _appendLog(String message) {
    final sink = _logSink;
    if (sink == null) {
      return;
    }

    try {
      sink.writeln('[${DateTime.now().toIso8601String()}] $message');
    } catch (e) {
      print('⚠️ 写入 gRPC 日志失败: $e');
    }
  }

  Future<void> _closeLogSink() async {
    if (_logSink == null) {
      return;
    }
    try {
      await _logSink!.flush();
    } catch (_) {}
    await _logSink!.close();
    _logSink = null;
  }

  Future<void> _cancelLogSubscriptions() async {
    if (_stdoutSubscription != null) {
      await _stdoutSubscription!.cancel();
      _stdoutSubscription = null;
    }
    if (_stderrSubscription != null) {
      await _stderrSubscription!.cancel();
      _stderrSubscription = null;
    }
  }

  /// 启动 gRPC 服务进程
  Future<void> startServer() async {
    if (_serverProcess != null) {
      print('Server already running on port $_port');
      return;
    }

    try {
      // 查找可用端口
      _port = await _findAvailablePort();
      print('📍 Selected port: $_port for gRPC server');

      // 获取二进制文件路径
      final String binaryPath = await _getGrpcBinaryPath();
      print('Using gRPC binary at: $binaryPath');

      await _ensureLogSink();
      _appendLog('准备启动 gRPC 进程，端口 $_port，二进制路径: $binaryPath');

      // 确保二进制有执行权限
      if (!Platform.isWindows) {
        try {
          final result = await Process.run('chmod', ['755', binaryPath]);
          if (result.exitCode == 0) {
            print('✅ Binary has execute permission');
          } else {
            print('⚠️ chmod warning: ${result.stderr}');
          }
        } catch (e) {
          print('⚠️ chmod failed (may be ok if already set): $e');
        }
      }

      // 启动服务进程
      print('🚀 Starting gRPC server on port $_port...');
      final launchArgs = ['-port', _port.toString()];
      print('🚀 Command: $binaryPath ${launchArgs.join(" ")}');
      _appendLog('启动命令: $binaryPath ${launchArgs.join(" ")}');
      _serverProcess = await Process.start(binaryPath, launchArgs, runInShell: true);
      print('🚀 Process started with PID: ${_serverProcess!.pid}');
      _appendLog('gRPC 进程已启动，PID: ${_serverProcess!.pid}');

      // 用于检测服务器是否启动成功
      bool serverStarted = false;
      final serverReadyCompleter = Completer<bool>();

      // 监听进程输出
      _stdoutSubscription = _serverProcess!.stdout
          .transform(utf8.decoder)
          .listen((data) {
            final output = data.replaceAll('\r', '').trimRight();
            if (output.isEmpty) {
              return;
            }
            print('gRPC server: $output');
            _appendLog('[STDOUT] $output');

            final normalized = output.toLowerCase();
            if (!serverStarted &&
                (normalized.contains('listening on') ||
                    normalized.contains('server listening'))) {
              serverStarted = true;
              if (!serverReadyCompleter.isCompleted) {
                serverReadyCompleter.complete(true);
              }
            }
          });

      _stderrSubscription = _serverProcess!.stderr
          .transform(utf8.decoder)
          .listen((data) {
            final errorOutput = data.replaceAll('\r', '').trimRight();
            if (errorOutput.isEmpty) {
              return;
            }
            print('gRPC server error: $errorOutput');
            _appendLog('[STDERR] $errorOutput');

            final normalizedError = errorOutput.toLowerCase();
            if (!serverStarted &&
                (normalizedError.contains('failed') ||
                    normalizedError.contains('error'))) {
              if (!serverReadyCompleter.isCompleted) {
                serverReadyCompleter.complete(false);
              }
            }
          });

      // 监听进程退出
      _serverProcess!.exitCode.then((exitCode) async {
        print('gRPC server exited with code $exitCode');
        _appendLog('gRPC 进程退出，退出码: $exitCode');
        await _cancelLogSubscriptions();
        await _closeLogSink();
        _serverProcess = null;
        if (!serverReadyCompleter.isCompleted) {
          serverReadyCompleter.complete(false);
        }
      });

      // 根据平台选择不同的启动检测方式
      bool serverReady = false;

      if (Platform.isAndroid) {
        // Android: 通过输出判断启动状态（最多等待 5 秒）
        try {
          serverReady = await serverReadyCompleter.future.timeout(
            const Duration(seconds: 5),
            onTimeout: () => false,
          );
          if (serverReady) {
            print('✅ gRPC server ready on port $_port (detected from output)');
            // Android 上额外等待一下，确保服务器完全准备好
            await Future.delayed(const Duration(milliseconds: 1000));
          } else {
            print('⚠️ Server startup detection timed out, but continuing...');
            // 即使超时也继续，可能服务器已经启动但输出格式不同
            // 等待足够时间让服务器启动
            await Future.delayed(const Duration(milliseconds: 2000));
            serverReady = true;
          }
        } catch (e) {
          print('⚠️ Server startup detection error: $e, but continuing...');
          await Future.delayed(const Duration(milliseconds: 2000));
          serverReady = true;
        }
      } else {
        // 其他平台: 使用 socket 连接测试（最多等待 5 秒）
        for (int i = 0; i < 10; i++) {
          await Future.delayed(const Duration(milliseconds: 500));
          try {
            final socket = await Socket.connect(
              _host,
              _port,
              timeout: const Duration(milliseconds: 500),
            );
            await socket.close();
            serverReady = true;
            print('✅ gRPC server ready on port $_port (${(i + 1) * 500}ms)');
            break;
          } catch (_) {
            // 继续等待
          }
        }

        if (!serverReady) {
          print('⚠️ Server may not be ready yet, but continuing...');
        }
      }
    } catch (e) {
      print('❌ Failed to start server: $e');
      _serverProcess = null;
      rethrow;
    }
  }

  /// 连接到 gRPC 服务（带重试）
  Future<void> connect({String? host, int? port}) async {
    if (host != null) {
      _customHost = host;
      print('📍 Custom host set: $host');
    }
    if (port != null) {
      _port = port;
      print('📍 Custom port set: $port');
    }

    print('📡 尝试连接到 $_host:$_port...');

    // 重试连接（最多 3 次，减少等待时间）
    for (int attempt = 1; attempt <= 3; attempt++) {
      try {
        _channel = ClientChannel(
          _host,
          port: _port,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        );

        _client = FatalderServiceClient(_channel!);

        // 测试连接（减少超时时间）
        await _client!
            .getFrameworkConfig(Empty())
            .timeout(const Duration(seconds: 2));

        print('✅ 已连接到 gRPC 服务 $_host:$_port');
        return;
      } catch (e) {
        print('连接尝试 $attempt/3 失败: ${e.toString().split('\n').first}');

        await disconnect();

        if (attempt < 3) {
          // Android 上增加重试等待时间
          final delayMs = Platform.isAndroid ? 1500 * attempt : 500 * attempt;
          await Future.delayed(Duration(milliseconds: delayMs));
        } else {
          print('❌ 3 次尝试后连接失败');
          rethrow;
        }
      }
    }
  }

  /// 断开连接
  Future<void> disconnect() async {
    await _channel?.shutdown();
    _channel = null;
    _client = null;
  }

  /// 停止服务进程
  Future<void> stopServer() async {
    if (_serverProcess != null) {
      if (_logSink != null) {
        _appendLog('收到停止请求，尝试结束 PID ${_serverProcess!.pid}');
      }
      _serverProcess!.kill();
      _serverProcess = null;
      await _cancelLogSubscriptions();
      print('gRPC server stopped');
    }
  }

  /// 初始化（启动服务并连接）
  Future<void> initialize() async {
    try {
      print('🚀 initialize() starting...');
      await startServer();
      print('🚀 startServer() completed, current port: $_port');
      await connect();
      print('🚀 connect() completed');
    } catch (e) {
      print('❌ Failed to initialize gRPC service: $e');
      rethrow;
    }
  }

  /// 清理资源
  Future<void> dispose() async {
    await disconnect();
    await stopServer();
  }
}
