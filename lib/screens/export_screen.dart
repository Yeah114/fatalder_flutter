import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';
import '../widgets/task_dialogs.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showExportTaskDialog();
    });
  }

  Future<void> _showExportTaskDialog() async {
    final appState = Provider.of<AppState>(context, listen: false);

    // 检查是否有服务器配置
    if (appState.serverConfigs.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请先添加服务器配置')),
      );
      Navigator.pop(context);
      return;
    }

    // 显示导出任务对话框
    final exportTask = await showDialog<ExportTask>(
      context: context,
      builder: (context) => const ExportTaskDialog(),
    );

    if (exportTask == null) {
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

    // 直接执行导出任务
    if (!mounted) return;
    await _executeQuickExportTask(serverConfig, exportTask);

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

  Future<void> _executeQuickExportTask(
    String serverConfigName,
    ExportTask exportTask,
  ) async {
    try {
      final request = StartExportRequest()
        ..serverConfigName = serverConfigName
        ..task = exportTask;

      if (!mounted) return;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _QuickExportProgressDialog(
          request: request,
          serverConfigName: serverConfigName,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('执行失败: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('开始导出'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// 快速导出进度对话框
class _QuickExportProgressDialog extends StatefulWidget {
  final StartExportRequest request;
  final String serverConfigName;

  const _QuickExportProgressDialog({
    required this.request,
    required this.serverConfigName,
  });

  @override
  State<_QuickExportProgressDialog> createState() => _QuickExportProgressDialogState();
}

class _QuickExportProgressDialogState extends State<_QuickExportProgressDialog> {
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
    _startExport();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _startExport() async {
    try {
      final stream = GrpcService().client.startExport(widget.request);

      await for (final progress in stream) {
        // 更新状态
        if (progress.message.isNotEmpty) {
          setState(() {
            _message = progress.message;
            _currentChunk = progress.currentChunk;
            _totalChunks = progress.totalChunks;
            _progressPercent = progress.progressPercent;
          });

          _addLog('[${progress.status}] ${progress.message}');

          if (progress.totalChunks > 0) {
            _addLog('  进度: ${progress.currentChunk}/${progress.totalChunks} (${progress.progressPercent.toStringAsFixed(1)}%)');
          }
        }

        // 显示日志消息
        if (progress.logMessage.isNotEmpty) {
          _addLog(progress.logMessage);
        }

        if (progress.status == 'failed') {
          setState(() => _isFailed = true);
          _addLog('❌ 导出失败!');
          return;
        }

        if (progress.status == 'completed') {
          setState(() => _isCompleted = true);
          _addLog('✅ 导出完成!');
          if (progress.outputPath.isNotEmpty) {
            _addLog('输出路径: ${progress.outputPath}');
          }
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
                    : Icons.upload_file,
            color: _isFailed
                ? Colors.red
                : _isCompleted
                    ? Colors.green
                    : Colors.blue,
          ),
          const SizedBox(width: 8),
          const Text('导出任务'),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        _logs[index],
                        style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
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
