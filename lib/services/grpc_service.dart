import 'dart:io';
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

  String _host = 'localhost';
  int _port = 12465;  // 默认起始端口改为 12465

  FatalderServiceClient get client {
    if (_client == null) {
      throw Exception('gRPC client not initialized. Call connect() first.');
    }
    return _client!;
  }

  bool get isConnected => _client != null;
  int get currentPort => _port;

  /// 检查端口是否可用
  Future<bool> _isPortAvailable(int port) async {
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

  /// 查找可用端口（从 12465 开始）
  Future<int> _findAvailablePort() async {
    int port = 12465;
    while (port < 12565) {  // 最多尝试 100 个端口
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
    // 1. 首先尝试从当前目录的 assets 查找（开发环境）
    final String devBinary = '${Directory.current.path}/assets/fatalder-grpc';
    if (await File(devBinary).exists()) {
      return devBinary;
    }

    // 2. 尝试从 Flutter bundle 的 data 目录（发布环境）
    final String bundleBinary = '${Directory.current.path}/data/flutter_assets/assets/fatalder-grpc';
    if (await File(bundleBinary).exists()) {
      return bundleBinary;
    }

    // 3. 尝试从应用文档目录
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String docBinary = '${appDocDir.path}/fatalder-grpc';
    if (await File(docBinary).exists()) {
      return docBinary;
    }

    // 4. 如果在 assets 目录找到，复制到文档目录
    if (await File(devBinary).exists()) {
      await File(devBinary).copy(docBinary);
      await Process.run('chmod', ['+x', docBinary]);
      return docBinary;
    }

    throw Exception('fatalder-grpc binary not found in:\n'
        '  - $devBinary\n'
        '  - $bundleBinary\n'
        '  - $docBinary');
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

      // 获取二进制文件路径
      final String binaryPath = await _getGrpcBinaryPath();
      print('Using gRPC binary at: $binaryPath');

      // 确保二进制有执行权限
      await Process.run('chmod', ['+x', binaryPath]);

      // 启动服务进程
      print('Starting gRPC server on port $_port...');
      _serverProcess = await Process.start(
        binaryPath,
        ['--port', _port.toString()],
      );

      // 监听进程输出
      _serverProcess!.stdout.listen((data) {
        print('gRPC server: ${String.fromCharCodes(data)}');
      });

      _serverProcess!.stderr.listen((data) {
        print('gRPC server error: ${String.fromCharCodes(data)}');
      });

      // 监听进程退出
      _serverProcess!.exitCode.then((exitCode) {
        print('gRPC server exited with code $exitCode');
        _serverProcess = null;
      });

      // 等待服务启动（增加等待时间）
      await Future.delayed(const Duration(seconds: 3));

      print('✅ gRPC server started on port $_port');
    } catch (e) {
      print('❌ Failed to start server: $e');
      _serverProcess = null;
      rethrow;
    }
  }

  /// 连接到 gRPC 服务（带重试）
  Future<void> connect({String? host, int? port}) async {
    if (host != null) _host = host;
    if (port != null) _port = port;

    print('尝试连接到 $_host:$_port...');

    // 重试连接（最多 5 次）
    for (int attempt = 1; attempt <= 5; attempt++) {
      try {
        _channel = ClientChannel(
          _host,
          port: _port,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        );

        _client = FatalderServiceClient(_channel!);

        // 测试连接
        await _client!.getFrameworkConfig(Empty()).timeout(
          const Duration(seconds: 5),
        );

        print('✅ 已连接到 gRPC 服务 $_host:$_port');
        return;
      } catch (e) {
        print('连接尝试 $attempt/5 失败: ${e.toString().split('\n').first}');

        await disconnect();

        if (attempt < 5) {
          // 等待后重试
          await Future.delayed(Duration(seconds: attempt));
        } else {
          print('❌ 5 次尝试后连接失败');
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
      _serverProcess!.kill();
      _serverProcess = null;
      print('gRPC server stopped');
    }
  }

  /// 初始化（启动服务并连接）
  Future<void> initialize() async {
    try {
      await startServer();
      await connect();
    } catch (e) {
      print('Failed to initialize gRPC service: $e');
      rethrow;
    }
  }

  /// 清理资源
  Future<void> dispose() async {
    await disconnect();
    await stopServer();
  }
}
