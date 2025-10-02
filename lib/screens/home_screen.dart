import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';
import 'server_config_screen.dart';
import 'task_group_screen.dart';
import 'build_screen.dart';
import 'export_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // 延迟到 build 完成后再执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.setLoading(true);

    try {
      final grpcService = GrpcService();

      // 加载服务器配置
      final serverConfigsResp = await grpcService.client.listServerConfigs(Empty());
      appState.setServerConfigs(serverConfigsResp.configs);

      // 加载任务组
      final taskGroupsResp = await grpcService.client.listTaskGroups(Empty());
      appState.setTaskGroups(taskGroupsResp.names);

      // 加载框架配置
      final frameworkConfig = await grpcService.client.getFrameworkConfig(Empty());
      appState.setFrameworkConfig(frameworkConfig);
    } catch (e) {
      appState.setError(e.toString());
    } finally {
      appState.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DashboardTab(),
      const ServerConfigScreen(),
      const TaskGroupScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fatalder'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: '概览',
          ),
          NavigationDestination(
            icon: Icon(Icons.dns),
            label: '服务器',
          ),
          NavigationDestination(
            icon: Icon(Icons.task),
            label: '任务',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        if (appState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (appState.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('错误: ${appState.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => appState.clearError(),
                  child: const Text('关闭'),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '快捷操作',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _QuickActionCard(
                      icon: Icons.construction,
                      title: '开始建造',
                      subtitle: '导入建筑到服务器',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BuildScreen()),
                        );
                      },
                    ),
                    _QuickActionCard(
                      icon: Icons.file_download,
                      title: '开始导出',
                      subtitle: '导出世界区域',
                      color: Colors.green,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ExportScreen()),
                        );
                      },
                    ),
                    _QuickActionCard(
                      icon: Icons.dns,
                      title: '服务器配置',
                      subtitle: '${appState.serverConfigs.length} 个配置',
                      color: Colors.orange,
                      onTap: () {
                        // Switch to server tab
                      },
                    ),
                    _QuickActionCard(
                      icon: Icons.task,
                      title: '任务组',
                      subtitle: '${appState.taskGroups.length} 个任务组',
                      color: Colors.purple,
                      onTap: () {
                        // Switch to task tab
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
