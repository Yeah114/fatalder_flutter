import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';
import '../widgets/task_dialogs.dart';

class BuildScreen extends StatefulWidget {
  const BuildScreen({super.key});

  @override
  State<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBuildTaskDialog();
    });
  }

  Future<void> _showBuildTaskDialog() async {
    final appState = Provider.of<AppState>(context, listen: false);

    // 检查是否有服务器配置
    if (appState.serverConfigs.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请先添加服务器配置')));
      Navigator.pop(context);
      return;
    }

    // 显示构建任务对话框
    final buildTask = await showDialog<BuildTask>(
      context: context,
      builder: (context) => const BuildTaskDialog(),
    );

    if (buildTask == null) {
      if (!mounted) return;
      Navigator.pop(context);
      return;
    }

    // 选择服务器配置
    if (!mounted) return;
    final serverConfig = await _selectServerConfig(appState);
    if (serverConfig == null) {
      if (!mounted) return;
      Navigator.pop(context);
      return;
    }

    // 直接执行构建任务
    if (!mounted) return;
    await _executeQuickBuildTask(serverConfig, buildTask);

    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<String?> _selectServerConfig(AppState appState) async {
    if (appState.serverConfigs.length == 1) {
      return appState.serverConfigs.first.name;
    }

    return await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择服务器配置'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: appState.serverConfigs.map((config) {
            return ListTile(
              leading: const Icon(Icons.dns),
              title: Text(config.name),
              subtitle: Text('Code: ${config.rentalServerCode}'),
              onTap: () => Navigator.pop(context, config.name),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _executeQuickBuildTask(
    String serverConfigName,
    BuildTask buildTask,
  ) async {
    try {
      final request = StartBuildRequest()
        ..serverConfigName = serverConfigName
        ..task = buildTask
        ..resumeFromInterrupt = false;

      if (!mounted) return;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _QuickBuildProgressDialog(
          request: request,
          serverConfigName: serverConfigName,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('执行失败: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('开始建造')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

// 快速构建进度对话框
class _QuickBuildProgressDialog extends StatefulWidget {
  final StartBuildRequest request;
  final String serverConfigName;

  const _QuickBuildProgressDialog({
    required this.request,
    required this.serverConfigName,
  });

  @override
  State<_QuickBuildProgressDialog> createState() =>
      _QuickBuildProgressDialogState();
}

class _QuickBuildProgressDialogState extends State<_QuickBuildProgressDialog> {
  String _message = '准备中...';
  int _currentChunk = 0;
  int _totalChunks = 0;
  double _progressPercent = 0.0;
  bool _isCompleted = false;
  bool _isFailed = false;

  final List<String> _logs = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _startBuild();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _startBuild() async {
    try {
      final stream = GrpcService().client.startBuild(widget.request);

      await for (final progress in stream) {
        // 调试：打印收到的进度信息
        print(
          'DEBUG: Received progress - status: ${progress.status}, message: ${progress.message}, logMessage: "${progress.logMessage}"',
        );

        // 更新状态
        if (progress.message.isNotEmpty) {
          setState(() {
            _message = progress.message;
            _currentChunk = progress.currentChunk;
            _totalChunks = progress.totalChunks;
            _progressPercent = progress.progressPercent;
          });

          _addLog('[${_getStatusLabel(progress.status)}] ${progress.message}');

          if (progress.totalChunks > 0) {
            _addLog(
              '  进度: ${progress.currentChunk}/${progress.totalChunks} (${progress.progressPercent.toStringAsFixed(1)}%)',
            );
          }
        }

        // 显示日志消息
        if (progress.logMessage.isNotEmpty) {
          print('DEBUG: Adding log message: ${progress.logMessage}');
          _addLog(progress.logMessage);
        }

        if (progress.status == 'failed') {
          setState(() => _isFailed = true);
          _addLog('❌ 构建失败!');
          return;
        }

        if (progress.status == 'completed') {
          setState(() => _isCompleted = true);
          _addLog('✅ 构建完成!');
          return;
        }
      }
    } catch (e) {
      setState(() {
        _isFailed = true;
        _message = '错误: $e';
      });
      _addLog('❌ 执行错误: $e');
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'parsing':
        return '解析中';
      case 'building':
        return '构建中';
      case 'completed':
        return '已完成';
      case 'failed':
        return '失败';
      case 'fix_mode':
        return '修补模式';
      case 'fixing':
        return '修补中';
      default:
        return status;
    }
  }

  void _addLog(String message) {
    setState(() {
      _logs.add(message);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            _isFailed
                ? Icons.error
                : _isCompleted
                ? Icons.check_circle
                : Icons.build,
            color: _isFailed
                ? Colors.red
                : _isCompleted
                ? Colors.green
                : Colors.blue,
          ),
          const SizedBox(width: 8),
          const Text('构建任务'),
        ],
      ),
      content: SizedBox(
        width: 500,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('服务器: ${widget.serverConfigName}'),
            const SizedBox(height: 8),
            Text('状态: $_message'),
            const SizedBox(height: 16),
            if (_totalChunks > 0) ...[
              Text('区块进度: $_currentChunk / $_totalChunks'),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: _totalChunks > 0 ? _currentChunk / _totalChunks : 0,
              ),
              const SizedBox(height: 4),
              Text('${_progressPercent.toStringAsFixed(1)}%'),
              const SizedBox(height: 16),
            ],
            const Divider(),
            const Text('执行日志', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Text(
                        _logs[index],
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'monospace',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (_isCompleted || _isFailed)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
      ],
    );
  }
}
