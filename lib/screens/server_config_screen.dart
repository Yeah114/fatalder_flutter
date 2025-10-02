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
                      const Text('No server configs yet'),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => _showAddDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Server Config'),
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
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'delete') {
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

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Server Config'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Config Name'),
            ),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: 'Server Code'),
            ),
            TextField(
              controller: passcodeController,
              decoration: const InputDecoration(labelText: 'Passcode'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final config = ServerConfig()
                ..name = nameController.text
                ..rentalServerCode = codeController.text
                ..rentalServerPasscode = passcodeController.text;

              try {
                await GrpcService().client.createServerConfig(config);
                final configs = await GrpcService().client.listServerConfigs(Empty());
                Provider.of<AppState>(context, listen: false).setServerConfigs(configs.configs);
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteConfig(BuildContext context, String name) async {
    try {
      await GrpcService().client.deleteServerConfig(DeleteServerConfigRequest()..name = name);
      final configs = await GrpcService().client.listServerConfigs(Empty());
      Provider.of<AppState>(context, listen: false).setServerConfigs(configs.configs);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
