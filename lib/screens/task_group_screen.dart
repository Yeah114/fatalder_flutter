import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';
import 'task_group_detail_screen.dart';
import 'task_execution_screen.dart';

class TaskGroupScreen extends StatefulWidget {
  const TaskGroupScreen({super.key});

  @override
  State<TaskGroupScreen> createState() => _TaskGroupScreenState();
}

class _TaskGroupScreenState extends State<TaskGroupScreen> {
  @override
  void initState() {
    super.initState();
    _loadTaskGroups();
  }

  Future<void> _loadTaskGroups() async {
    try {
      final response = await GrpcService().client.listTaskGroups(Empty());
      if (!mounted) return;
      Provider.of<AppState>(context, listen: false).setTaskGroups(response.names);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载任务组失败: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: appState.taskGroups.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.task_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text('暂无任务组'),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => _showCreateDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('创建任务组'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: appState.taskGroups.length,
                  itemBuilder: (context, index) {
                    final taskGroupName = appState.taskGroups[index];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.task)),
                      title: Text(taskGroupName),
                      subtitle: const Text('点击查看详情'),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'view',
                            child: Text('查看详情'),
                          ),
                          const PopupMenuItem(
                            value: 'execute',
                            child: Text('执行'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('删除'),
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'view':
                              _viewTaskGroup(taskGroupName);
                              break;
                            case 'execute':
                              _executeTaskGroup(taskGroupName);
                              break;
                            case 'delete':
                              _deleteTaskGroup(taskGroupName);
                              break;
                          }
                        },
                      ),
                      onTap: () => _viewTaskGroup(taskGroupName),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'task_group_fab',
            onPressed: () => _showCreateDialog(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建任务组'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: '任务组名称',
            hintText: '请输入任务组名称',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入任务组名称')),
                );
                return;
              }

              Navigator.pop(context);

              // 跳转到任务组详情页面进行编辑
              if (!mounted) return;
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskGroupDetailScreen(
                    taskGroupName: nameController.text,
                    isNew: true,
                  ),
                ),
              );

              // 刷新列表
              _loadTaskGroups();
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );
  }

  Future<void> _viewTaskGroup(String taskGroupName) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskGroupDetailScreen(
          taskGroupName: taskGroupName,
          isNew: false,
        ),
      ),
    );

    // 刷新列表
    _loadTaskGroups();
  }

  Future<void> _executeTaskGroup(String taskGroupName) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskExecutionScreen(
          taskGroupName: taskGroupName,
        ),
      ),
    );
  }

  Future<void> _deleteTaskGroup(String taskGroupName) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除任务组 "$taskGroupName" 吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await GrpcService().client.deleteTaskGroup(
        DeleteTaskGroupRequest()..name = taskGroupName,
      );

      if (!mounted) return;
      _loadTaskGroups();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('删除成功')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('删除失败: $e')),
      );
    }
  }
}
