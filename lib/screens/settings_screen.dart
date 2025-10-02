import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/app_state.dart';
import '../services/grpc_service.dart';
import '../generated/fatalder.pbgrpc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        final config = appState.frameworkConfig;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 连接状态卡片
            _buildConnectionCard(context, appState),
            const SizedBox(height: 16),

            // 框架配置
            _buildSectionTitle('框架配置'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('语言'),
                    subtitle: Text(_getLanguageDisplayName(config?.language ?? 'zh')),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showLanguageDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.folder_open),
                    title: const Text('存储路径'),
                    subtitle: Text(config?.storagePath ?? '未设置'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showStoragePathDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('GitHub 源'),
                    subtitle: Text(config?.githubBaseUrl ?? 'https://github.com'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showGitHubBaseUrlDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 构建任务配置
            _buildSectionTitle('构建任务配置'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.speed),
                    title: const Text('单次解析区块数'),
                    subtitle: Text('${config?.buildConfig?.minOnceParseChunkNum ?? 512} 个区块'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showMinOnceParseChunkNumDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.percent),
                    title: const Text('最小匹配度'),
                    subtitle: Text('${config?.buildConfig?.minMatchingDegree?.toStringAsFixed(1) ?? '90.0'}%'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showMinMatchingDegreeDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.layers),
                    title: const Text('最大修补深度'),
                    subtitle: Text('${config?.buildConfig?.maxFixDepth ?? 5} 次'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showMaxFixDepthDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 用户中心配置
            _buildSectionTitle('用户中心'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.cloud),
                    title: const Text('用户中心地址'),
                    subtitle: Text(config?.userCenterConfig?.baseRoot ?? '未设置'),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showUserCenterHostDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.key),
                    title: const Text('API 密钥'),
                    subtitle: Text(_maskApiKey(config?.userCenterConfig?.apiKey ?? '')),
                    trailing: const Icon(Icons.edit),
                    onTap: () => _showApiKeyDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 应用信息
            _buildSectionTitle('应用'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('关于 Fatalder'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showAboutDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('开源许可'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showLicensesDialog(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 危险操作
            _buildSectionTitle('高级'),
            Card(
              color: Colors.red.withOpacity(0.1),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.refresh, color: Colors.orange),
                    title: const Text('重启 gRPC 服务'),
                    subtitle: const Text('重启后台服务进程'),
                    onTap: () => _restartGrpcService(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.delete_outline, color: Colors.red),
                    title: const Text('清除所有数据'),
                    subtitle: const Text('删除所有配置和任务数据'),
                    onTap: () => _showClearDataDialog(context),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildConnectionCard(BuildContext context, AppState appState) {
    final grpcService = GrpcService();
    final isConnected = appState.isConnected;

    return Card(
      color: isConnected ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isConnected ? Icons.check_circle : Icons.error,
              color: isConnected ? Colors.green : Colors.red,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isConnected ? '已连接' : '未连接',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    isConnected
                      ? 'gRPC 服务运行在端口 ${grpcService.currentPort}'
                      : '无法连接到 gRPC 服务',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  String _maskApiKey(String key) {
    if (key.isEmpty) return '未设置';
    if (key.length <= 8) return '********';
    return '${key.substring(0, 4)}****${key.substring(key.length - 4)}';
  }

  String _getLanguageDisplayName(String langCode) {
    switch (langCode) {
      case 'zh':
        return '简体中文';
      case 'en':
        return 'English';
      default:
        return langCode;
    }
  }

  // 显示语言选择对话框
  void _showLanguageDialog(BuildContext context) {
    final languages = ['zh', 'en'];
    final appState = Provider.of<AppState>(context, listen: false);
    final currentLang = appState.frameworkConfig?.language ?? 'zh';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择语言'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            return RadioListTile<String>(
              title: Text(lang == 'zh' ? '简体中文' : 'English'),
              value: lang,
              groupValue: currentLang,
              onChanged: (value) async {
                if (value != null) {
                  await _updateFrameworkConfig(language: value);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // 显示存储路径对话框
  void _showStoragePathDialog(BuildContext context) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath(
      dialogTitle: '选择存储路径',
    );

    if (selectedDirectory != null) {
      await _updateFrameworkConfig(storagePath: selectedDirectory);
    }
  }

  // 显示用户中心地址对话框
  void _showUserCenterHostDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: appState.frameworkConfig?.userCenterConfig?.baseRoot ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('用户中心地址'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'URL',
            hintText: 'https://api.example.com',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              await _updateFrameworkConfig(userCenterHost: controller.text);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  // 显示 API 密钥对话框
  void _showApiKeyDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: appState.frameworkConfig?.userCenterConfig?.apiKey ?? '',
    );
    bool obscureText = true;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('API 密钥'),
          content: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: 'API Key',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() => obscureText = !obscureText);
                },
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () async {
                await _updateFrameworkConfig(userCenterApiKey: controller.text);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  // 更新框架配置
  Future<void> _updateFrameworkConfig({
    String? language,
    String? storagePath,
    String? userCenterHost,
    String? userCenterApiKey,
    String? githubBaseUrl,
  }) async {
    try {
      final grpcService = GrpcService();
      final appState = Provider.of<AppState>(context, listen: false);
      final currentConfig = appState.frameworkConfig;

      // 构建 UserCenterConfig
      final userCenterConfig = UserCenterConfig(
        baseRoot: userCenterHost ?? currentConfig?.userCenterConfig?.baseRoot ?? '',
        apiKey: userCenterApiKey ?? currentConfig?.userCenterConfig?.apiKey ?? '',
      );

      final newConfig = FrameworkConfig(
        language: language ?? currentConfig?.language ?? 'zh',
        storagePath: storagePath ?? currentConfig?.storagePath ?? '',
        userCenterConfig: userCenterConfig,
        buildConfig: currentConfig?.buildConfig ?? BuildTaskConfig(),
        githubBaseUrl: githubBaseUrl ?? currentConfig?.githubBaseUrl ?? 'https://github.com',
      );

      final updatedConfig = await grpcService.client.updateFrameworkConfig(newConfig);
      appState.setFrameworkConfig(updatedConfig);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('配置已保存')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }

  // 显示关于对话框
  void _showAboutDialog(BuildContext context) {
    final grpcService = GrpcService();

    showAboutDialog(
      context: context,
      applicationName: 'Fatalder',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.apps, size: 64),
      applicationLegalese: '© 2025 Fatalder Team',
      children: [
        const SizedBox(height: 16),
        const Text('Minecraft Bedrock 世界管理工具'),
        const SizedBox(height: 8),
        Text('gRPC 端口: ${grpcService.currentPort}'),
      ],
    );
  }

  // 显示开源许可对话框
  void _showLicensesDialog(BuildContext context) {
    showLicensePage(
      context: context,
      applicationName: 'Fatalder',
      applicationVersion: '1.0.0',
    );
  }

  // 重启 gRPC 服务
  void _restartGrpcService(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重启 gRPC 服务'),
        content: const Text('确定要重启后台服务吗？\n\n正在进行的任务可能会被中断。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);

              final appState = Provider.of<AppState>(context, listen: false);
              appState.setLoading(true);

              try {
                final grpcService = GrpcService();
                await grpcService.stopServer();
                await Future.delayed(const Duration(seconds: 1));
                await grpcService.initialize();
                appState.setConnected(true);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('gRPC 服务已重启')),
                  );
                }
              } catch (e) {
                appState.setConnected(false);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('重启失败: $e')),
                  );
                }
              } finally {
                appState.setLoading(false);
              }
            },
            child: const Text('重启'),
          ),
        ],
      ),
    );
  }

  // 显示清除数据对话框
  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清除所有数据'),
        content: const Text(
          '此操作将删除所有配置和任务数据，且无法恢复。\n\n确定要继续吗？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('清除数据功能待实现')),
              );
            },
            child: const Text('确认删除'),
          ),
        ],
      ),
    );
  }

  // 显示 GitHub 源对话框
  void _showGitHubBaseUrlDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: appState.frameworkConfig?.githubBaseUrl ?? 'https://github.com',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('GitHub 源'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'GitHub 基础 URL',
            hintText: 'https://github.com',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              await _updateFrameworkConfig(githubBaseUrl: controller.text);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  // 显示单次解析区块数对话框
  void _showMinOnceParseChunkNumDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: (appState.frameworkConfig?.buildConfig?.minOnceParseChunkNum ?? 512).toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('单次解析区块数'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设置每次解析的最小区块数量。\n值越大，解析速度越快，但内存占用越高。',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '区块数',
                hintText: '512',
                border: OutlineInputBorder(),
                suffixText: '个',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              final value = int.tryParse(controller.text);
              if (value == null || value < 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入大于 0 的整数')),
                );
                return;
              }
              await _updateBuildConfig(minOnceParseChunkNum: value);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  // 显示最小匹配度对话框
  void _showMinMatchingDegreeDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: (appState.frameworkConfig?.buildConfig?.minMatchingDegree ?? 90.0).toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('最小匹配度'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设置区块匹配的最小百分比。\n值越高，构建质量越好，但可能导致某些区块无法放置。',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: '匹配度',
                hintText: '90.0',
                border: OutlineInputBorder(),
                suffixText: '%',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              final value = double.tryParse(controller.text);
              if (value == null || value < 0 || value > 100) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入 0-100 之间的数值')),
                );
                return;
              }
              await _updateBuildConfig(minMatchingDegree: value);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  // 显示最大修补深度对话框
  void _showMaxFixDepthDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final controller = TextEditingController(
      text: (appState.frameworkConfig?.buildConfig?.maxFixDepth ?? 5).toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('最大修补深度'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设置自动修补区块的最大尝试次数。\n值越大，修补成功率越高，但耗时越长。',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '修补次数',
                hintText: '5',
                border: OutlineInputBorder(),
                suffixText: '次',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              final value = int.tryParse(controller.text);
              if (value == null || value < 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入大于 0 的整数')),
                );
                return;
              }
              await _updateBuildConfig(maxFixDepth: value);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  // 更新构建配置
  Future<void> _updateBuildConfig({
    int? minOnceParseChunkNum,
    double? minMatchingDegree,
    int? maxFixDepth,
  }) async {
    try {
      final grpcService = GrpcService();
      final appState = Provider.of<AppState>(context, listen: false);
      final currentConfig = appState.frameworkConfig;
      final currentBuildConfig = currentConfig?.buildConfig;

      final newBuildConfig = BuildTaskConfig(
        minOnceParseChunkNum: minOnceParseChunkNum ?? currentBuildConfig?.minOnceParseChunkNum ?? 512,
        minMatchingDegree: minMatchingDegree ?? currentBuildConfig?.minMatchingDegree ?? 90.0,
        maxFixDepth: maxFixDepth ?? currentBuildConfig?.maxFixDepth ?? 5,
      );

      final newConfig = FrameworkConfig(
        language: currentConfig?.language ?? 'zh',
        storagePath: currentConfig?.storagePath ?? '',
        buildConfig: newBuildConfig,
        githubBaseUrl: currentConfig?.githubBaseUrl ?? 'https://github.com',
        userCenterConfig: currentConfig?.userCenterConfig ?? UserCenterConfig(),
      );

      final updatedConfig = await grpcService.client.updateFrameworkConfig(newConfig);
      appState.setFrameworkConfig(updatedConfig);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('配置已保存')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }
}
