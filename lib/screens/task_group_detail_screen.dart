import 'package:flutter/material.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';
import '../widgets/task_dialogs.dart';

class TaskGroupDetailScreen extends StatefulWidget {
  final String taskGroupName;
  final bool isNew;

  const TaskGroupDetailScreen({
    super.key,
    required this.taskGroupName,
    this.isNew = false,
  });

  @override
  State<TaskGroupDetailScreen> createState() => _TaskGroupDetailScreenState();
}

class _TaskGroupDetailScreenState extends State<TaskGroupDetailScreen> {
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isNew) {
      _loadTaskGroup();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadTaskGroup() async {
    try {
      final response = await GrpcService().client.getTaskGroup(
        GetTaskGroupRequest()..name = widget.taskGroupName,
      );

      setState(() {
        tasks = response.tasks;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载任务组失败: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskGroupName),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTaskGroup,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.task_alt, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text('暂无任务'),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _addTask,
                        icon: const Icon(Icons.add),
                        label: const Text('添加任务'),
                      ),
                    ],
                  ),
                )
              : ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex--;
                      }
                      final item = tasks.removeAt(oldIndex);
                      tasks.insert(newIndex, item);
                    });
                  },
                  children: [
                    for (int index = 0; index < tasks.length; index++)
                      _buildTaskItem(tasks[index], index),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'task_detail_fab',
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskItem(Task task, int index) {
    String taskType = '未知';
    String taskInfo = '';
    String subtitle = '';

    if (task.hasBuildTask()) {
      taskType = '构建';
      final bt = task.buildTask;
      taskInfo = bt.filePath.split('/').last;
      subtitle = '起点: (${bt.startPos.x}, ${bt.startPos.y}, ${bt.startPos.z}) | 速度: ${bt.speed}';
    } else if (task.hasExportTask()) {
      taskType = '导出';
      final et = task.exportTask;
      taskInfo = et.filePath.split('/').last;
      subtitle = '从 (${et.startPos.x}, ${et.startPos.y}, ${et.startPos.z}) 到 (${et.endPos.x}, ${et.endPos.y}, ${et.endPos.z})';
    }

    return Card(
      key: ValueKey(index),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text('[$taskType] $taskInfo'),
        subtitle: Text(subtitle),
        trailing: SizedBox(
          width: 136,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _editTask(index),
                tooltip: '编辑',
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteTask(index),
                tooltip: '删除',
              ),
              ReorderableDragStartListener(
                index: index,
                child: MouseRegion(
                  cursor: SystemMouseCursors.grab,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.drag_handle,
                      color: Theme.of(context).colorScheme.primary,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择任务类型'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('构建任务'),
              onTap: () {
                Navigator.pop(context);
                _addBuildTask();
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload_file),
              title: const Text('导出任务'),
              onTap: () {
                Navigator.pop(context);
                _addExportTask();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addBuildTask() async {
    final result = await showDialog<BuildTask>(
      context: context,
      builder: (context) => const BuildTaskDialog(),
    );

    if (result != null) {
      setState(() {
        tasks.add(Task()..buildTask = result);
      });
    }
  }

  Future<void> _addExportTask() async {
    final result = await showDialog<ExportTask>(
      context: context,
      builder: (context) => const ExportTaskDialog(),
    );

    if (result != null) {
      setState(() {
        tasks.add(Task()..exportTask = result);
      });
    }
  }

  Future<void> _editTask(int index) async {
    final task = tasks[index];

    if (task.hasBuildTask()) {
      final result = await showDialog<BuildTask>(
        context: context,
        builder: (context) => BuildTaskDialog(initialTask: task.buildTask),
      );

      if (result != null) {
        setState(() {
          tasks[index] = Task()..buildTask = result;
        });
      }
    } else if (task.hasExportTask()) {
      final result = await showDialog<ExportTask>(
        context: context,
        builder: (context) => ExportTaskDialog(initialTask: task.exportTask),
      );

      if (result != null) {
        setState(() {
          tasks[index] = Task()..exportTask = result;
        });
      }
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  Future<void> _saveTaskGroup() async {
    try {
      if (widget.isNew) {
        await GrpcService().client.createTaskGroup(
          CreateTaskGroupRequest()
            ..name = widget.taskGroupName
            ..tasks.addAll(tasks),
        );
      }
      // Note: UpdateTaskGroup doesn't exist in proto, so we delete and recreate
      else {
        await GrpcService().client.deleteTaskGroup(
          DeleteTaskGroupRequest()..name = widget.taskGroupName,
        );
        await GrpcService().client.createTaskGroup(
          CreateTaskGroupRequest()
            ..name = widget.taskGroupName
            ..tasks.addAll(tasks),
        );
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('保存成功')),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('保存失败: $e')),
      );
    }
  }
}
