import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';

class ServerConfigScreen extends StatelessWidget {
  const ServerConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: appState.serverConfigs.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.dns_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text('暂无服务器配置'),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => _showAddDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('添加服务器配置'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: appState.serverConfigs.length,
                  itemBuilder: (context, index) {
                    final config = appState.serverConfigs[index];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.dns)),
                      title: Text(config.name),
                      subtitle: Text('Code: ${config.rentalServerCode}'),
                      onTap: () => _showEditDialog(context, config),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('编辑'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('删除'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditDialog(context, config);
                          } else if (value == 'delete') {
                            _deleteConfig(context, config.name);
                          }
                        },
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddDialog(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    final passcodeController = TextEditingController();
    bool obscurePassword = true;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('添加服务器配置'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '配置名称'),
              ),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '服务器代码'),
              ),
              TextField(
                controller: passcodeController,
                decoration: InputDecoration(
                  labelText: '密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: obscurePassword,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isEmpty || codeController.text.isEmpty || passcodeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请填写所有字段')),
                  );
                  return;
                }

                final config = ServerConfig()
                  ..name = nameController.text
                  ..rentalServerCode = codeController.text
                  ..rentalServerPasscode = passcodeController.text;

                try {
                  await GrpcService().client.createServerConfig(config);
                  if (!context.mounted) return;
                  final configs = await GrpcService().client.listServerConfigs(Empty());
                  if (!context.mounted) return;
                  Provider.of<AppState>(context, listen: false).setServerConfigs(configs.configs);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('添加成功')),
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('错误: $e')),
                  );
                }
              },
              child: const Text('添加'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, ServerConfig config) {
    final originalName = config.name; // 保存原始名称用于删除旧配置
    final nameController = TextEditingController(text: config.name);
    final codeController = TextEditingController(text: config.rentalServerCode);
    final passcodeController = TextEditingController(text: config.rentalServerPasscode);
    bool obscurePassword = true;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('编辑服务器配置'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '配置名称'),
              ),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '服务器代码'),
              ),
              TextField(
                controller: passcodeController,
                decoration: InputDecoration(
                  labelText: '密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: obscurePassword,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isEmpty || codeController.text.isEmpty || passcodeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请填写所有字段')),
                  );
                  return;
                }

                final updatedConfig = ServerConfig()
                  ..name = nameController.text
                  ..rentalServerCode = codeController.text
                  ..rentalServerPasscode = passcodeController.text;

                try {
                  // 如果名称改变了，需要先删除旧的，再创建新的
                  if (originalName != nameController.text) {
                    await GrpcService().client.deleteServerConfig(DeleteServerConfigRequest()..name = originalName);
                    await GrpcService().client.createServerConfig(updatedConfig);
                  } else {
                    await GrpcService().client.updateServerConfig(updatedConfig);
                  }

                  if (!context.mounted) return;
                  final configs = await GrpcService().client.listServerConfigs(Empty());
                  if (!context.mounted) return;
                  Provider.of<AppState>(context, listen: false).setServerConfigs(configs.configs);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('更新成功')),
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('错误: $e')),
                  );
                }
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteConfig(BuildContext context, String name) async {
    try {
      await GrpcService().client.deleteServerConfig(DeleteServerConfigRequest()..name = name);
      if (!context.mounted) return;
      final configs = await GrpcService().client.listServerConfigs(Empty());
      if (!context.mounted) return;
      Provider.of<AppState>(context, listen: false).setServerConfigs(configs.configs);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('删除成功')),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('错误: $e')),
      );
    }
  }
}
