import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';

class TaskExecutionScreen extends StatefulWidget {
  final String taskGroupName;

  const TaskExecutionScreen({
    super.key,
    required this.taskGroupName,
  });

  @override
  State<TaskExecutionScreen> createState() => _TaskExecutionScreenState();
}

class _TaskExecutionScreenState extends State<TaskExecutionScreen> {
  String? _selectedServerConfig;
  bool _isExecuting = false;
  bool _isCompleted = false;
  bool _isFailed = false;

  // 进度信息
  int _currentTaskIndex = 0;
  int _totalTasks = 0;
  String _currentTaskType = '';
  String _statusMessage = '';
  int _currentChunk = 0;
  int _totalChunks = 0;
  double _progressPercent = 0.0;
  String _status = '';

  final List<String> _logs = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('执行任务组: ${widget.taskGroupName}'),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 服务器配置选择
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '选择服务器配置',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '服务器配置',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _selectedServerConfig,
                          items: appState.serverConfigs.map((config) {
                            return DropdownMenuItem(
                              value: config.name,
                              child: Text(config.name),
                            );
                          }).toList(),
                          onChanged: _isExecuting
                              ? null
                              : (value) {
                                  setState(() {
                                    _selectedServerConfig = value;
                                  });
                                },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 执行按钮
                if (!_isExecuting && !_isCompleted)
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _selectedServerConfig == null
                          ? null
                          : _startExecution,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('开始执行'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                // 进度显示
                if (_isExecuting || _isCompleted || _isFailed)
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 状态标题
                            Row(
                              children: [
                                Icon(
                                  _isFailed
                                      ? Icons.error
                                      : _isCompleted
                                          ? Icons.check_circle
                                          : Icons.hourglass_bottom,
                                  color: _isFailed
                                      ? Colors.red
                                      : _isCompleted
                                          ? Colors.green
                                          : Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _isFailed
                                      ? '执行失败'
                                      : _isCompleted
                                          ? '执行完成'
                                          : '执行中...',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // 任务进度
                            if (_totalTasks > 0) ...[
                              Text(
                                '任务进度: $_currentTaskIndex / $_totalTasks',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: _totalTasks > 0
                                    ? _currentTaskIndex / _totalTasks
                                    : 0,
                              ),
                              const SizedBox(height: 16),
                            ],

                            // 当前任务信息
                            if (_currentTaskType.isNotEmpty) ...[
                              Text(
                                '当前任务: $_currentTaskType',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                            ],

                            // 状态信息
                            if (_statusMessage.isNotEmpty) ...[
                              Text(
                                '状态: $_statusMessage',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                            ],

                            // 区块进度
                            if (_totalChunks > 0) ...[
                              Text(
                                '区块进度: $_currentChunk / $_totalChunks',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: _totalChunks > 0
                                    ? _currentChunk / _totalChunks
                                    : 0,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${_progressPercent.toStringAsFixed(1)}%',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],

                            const Divider(),

                            // 日志
                            const Text(
                              '执行日志',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _startExecution() async {
    if (_selectedServerConfig == null) return;

    setState(() {
      _isExecuting = true;
      _isCompleted = false;
      _isFailed = false;
      _logs.clear();
      _currentTaskIndex = 0;
      _totalTasks = 0;
      _currentTaskType = '';
      _statusMessage = '';
      _currentChunk = 0;
      _totalChunks = 0;
      _progressPercent = 0.0;
    });

    _addLog('开始执行任务组: ${widget.taskGroupName}');
    _addLog('服务器配置: $_selectedServerConfig');
    _addLog('');

    try {
      final request = ExecuteTaskGroupRequest()
        ..taskGroupName = widget.taskGroupName
        ..serverConfigName = _selectedServerConfig!;

      final stream = GrpcService().client.executeTaskGroup(request);

      await for (final progress in stream) {
        setState(() {
          _currentTaskIndex = progress.taskIndex;
          _totalTasks = progress.totalTasks;
          _currentTaskType = progress.taskType;
          _statusMessage = progress.message;
          _currentChunk = progress.currentChunk;
          _totalChunks = progress.totalChunks;
          _progressPercent = progress.progressPercent;
          _status = progress.status;
        });

        // 添加日志
        final taskLabel = '任务 ${progress.taskIndex}/${progress.totalTasks}';
        final statusLabel = _getStatusLabel(progress.status);
        _addLog('[$taskLabel] $statusLabel - ${progress.message}');

        if (progress.totalChunks > 0) {
          _addLog(
              '  进度: ${progress.currentChunk}/${progress.totalChunks} 区块 (${progress.progressPercent.toStringAsFixed(1)}%)');
        }

        // 检查是否失败
        if (progress.status == 'failed') {
          setState(() {
            _isFailed = true;
            _isExecuting = false;
          });
          _addLog('');
          _addLog('❌ 任务执行失败!');
          return;
        }

        // 检查是否完成
        if (progress.status == 'completed' &&
            progress.taskIndex >= progress.totalTasks) {
          setState(() {
            _isCompleted = true;
            _isExecuting = false;
          });
          _addLog('');
          _addLog('✅ 所有任务执行完成!');
          return;
        }
      }

      // Stream结束
      setState(() {
        _isCompleted = true;
        _isExecuting = false;
      });
      _addLog('');
      _addLog('✅ 任务组执行完成');
    } catch (e) {
      setState(() {
        _isFailed = true;
        _isExecuting = false;
      });
      _addLog('');
      _addLog('❌ 执行错误: $e');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('执行失败: $e')),
      );
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'preparing':
        return '准备中';
      case 'running':
        return '运行中';
      case 'completed':
        return '已完成';
      case 'failed':
        return '失败';
      default:
        return status;
    }
  }

  void _addLog(String message) {
    setState(() {
      _logs.add(message);
    });

    // 自动滚动到底部
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
}
