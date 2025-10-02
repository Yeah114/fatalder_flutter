import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../generated/fatalder.pbgrpc.dart';

/// 构建任务配置对话框
class BuildTaskDialog extends StatefulWidget {
  final BuildTask? initialTask;

  const BuildTaskDialog({super.key, this.initialTask});

  @override
  State<BuildTaskDialog> createState() => _BuildTaskDialogState();
}

class _BuildTaskDialogState extends State<BuildTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _filePathController = TextEditingController();

  // 基础字段
  String _filePath = '';
  int _startX = 0, _startY = 0, _startZ = 0;
  int _speed = 3000;

  // 清理选项
  bool _autoCleanBlock = true;
  bool _autoCleanItem = true;

  // 验证选项
  int _verifyAfterChunk = 1;
  int _verifyChunkLevel = 3; // 1=无, 2=空气, 3=相似, 4=完整

  // 进度
  int _progress = 0;

  // 命令方块选项
  bool _autoDisableCommand = true;
  bool _autoUpgradeCommand = true;
  bool _ignoreCommandBlock = false;
  bool _ignoreOtherNBTBlock = false;

  // 控制台坐标
  bool _useCustomConsolePos = false;
  int _consoleX = -50, _consoleY = 0, _consoleZ = -50;

  // NBT进度显示
  bool _showNBTProgress = true;

  // 文件路径输入方式
  bool _useManualInput = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialTask != null) {
      final task = widget.initialTask!;
      _filePath = task.filePath;
      _filePathController.text = task.filePath;
      _startX = task.startPos.x;
      _startY = task.startPos.y;
      _startZ = task.startPos.z;
      _speed = task.speed;
      _autoCleanBlock = task.autoCleanBlock;
      _autoCleanItem = task.autoCleanItem;
      _verifyAfterChunk = task.verifyAfterChunk;
      _verifyChunkLevel = task.verifyChunkLevel;
      _progress = task.progress;
      _autoDisableCommand = task.autoDisableCommand;
      _autoUpgradeCommand = task.autoUpgradeCommand;
      _ignoreCommandBlock = task.ignoreCommandBlock;
      _ignoreOtherNBTBlock = task.ignoreOtherNbtBlock;
      _consoleX = task.consoleWorldPos.x;
      _consoleY = task.consoleWorldPos.y;
      _consoleZ = task.consoleWorldPos.z;
      _useCustomConsolePos = _consoleX != -50 || _consoleY != 0 || _consoleZ != -50;
      _showNBTProgress = task.showNbtProgress;
    }
  }

  @override
  void dispose() {
    _filePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('配置构建任务'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 文件选择
              _buildSectionTitle('文件设置'),
              Row(
                children: [
                  Expanded(
                    child: _useManualInput
                        ? TextField(
                            controller: _filePathController,
                            decoration: const InputDecoration(
                              labelText: '文件路径',
                              hintText: '输入完整文件路径',
                            ),
                            onChanged: (v) => _filePath = v,
                          )
                        : ListTile(
                            title: Text(_filePath.isEmpty ? '选择构建文件' : _filePath),
                            trailing: const Icon(Icons.folder_open),
                            onTap: _pickFile,
                          ),
                  ),
                  IconButton(
                    icon: Icon(_useManualInput ? Icons.folder_open : Icons.edit),
                    tooltip: _useManualInput ? '浏览文件' : '手动输入',
                    onPressed: () {
                      setState(() {
                        _useManualInput = !_useManualInput;
                        if (!_useManualInput) {
                          _filePathController.text = _filePath;
                        }
                      });
                    },
                  ),
                ],
              ),

              const Divider(),

              // 起始坐标
              _buildSectionTitle('起始坐标'),
              Row(
                children: [
                  Expanded(child: _buildIntField('X', _startX, (v) => _startX = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Y', _startY, (v) => _startY = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Z', _startZ, (v) => _startZ = v)),
                ],
              ),

              const Divider(),

              // 速度设置
              _buildSectionTitle('速度设置'),
              _buildIntField('速度 (方块/秒)', _speed, (v) => _speed = v),

              const Divider(),

              // 清理选项
              _buildSectionTitle('清理选项'),
              SwitchListTile(
                title: const Text('自动清除原方块'),
                value: _autoCleanBlock,
                onChanged: (v) => setState(() => _autoCleanBlock = v),
              ),
              SwitchListTile(
                title: const Text('自动清除掉落物'),
                value: _autoCleanItem,
                onChanged: (v) => setState(() => _autoCleanItem = v),
              ),

              const Divider(),

              // 验证选项
              _buildSectionTitle('验证设置'),
              _buildIntField('验证间隔 (区块)', _verifyAfterChunk, (v) => _verifyAfterChunk = v),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: '验证等级'),
                initialValue: _verifyChunkLevel,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('无验证')),
                  DropdownMenuItem(value: 2, child: Text('空气验证')),
                  DropdownMenuItem(value: 3, child: Text('相似验证')),
                  DropdownMenuItem(value: 4, child: Text('完整验证')),
                ],
                onChanged: (v) => setState(() => _verifyChunkLevel = v!),
              ),

              const Divider(),

              // 进度设置
              _buildSectionTitle('进度设置'),
              _buildIntField('起始进度 (%)', _progress, (v) => _progress = v),

              const Divider(),

              // 命令方块选项
              _buildSectionTitle('命令方块选项'),
              SwitchListTile(
                title: const Text('自动关闭命令方块启用'),
                value: _autoDisableCommand,
                onChanged: (v) => setState(() => _autoDisableCommand = v),
              ),
              SwitchListTile(
                title: const Text('自动升级命令方块命令'),
                value: _autoUpgradeCommand,
                onChanged: (v) => setState(() => _autoUpgradeCommand = v),
              ),
              SwitchListTile(
                title: const Text('忽略命令方块'),
                value: _ignoreCommandBlock,
                onChanged: (v) => setState(() => _ignoreCommandBlock = v),
              ),
              SwitchListTile(
                title: const Text('忽略其他NBT方块'),
                value: _ignoreOtherNBTBlock,
                onChanged: (v) => setState(() => _ignoreOtherNBTBlock = v),
              ),

              const Divider(),

              // 控制台坐标
              _buildSectionTitle('控制台坐标'),
              SwitchListTile(
                title: const Text('自定义控制台坐标'),
                subtitle: Text(_useCustomConsolePos
                  ? '当前: $_consoleX, $_consoleY, $_consoleZ'
                  : '默认: -50, 0, -50'),
                value: _useCustomConsolePos,
                onChanged: (v) => setState(() => _useCustomConsolePos = v),
              ),
              if (_useCustomConsolePos) ...[
                Row(
                  children: [
                    Expanded(child: _buildIntField('X', _consoleX, (v) => _consoleX = v)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildIntField('Y', _consoleY, (v) => _consoleY = v)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildIntField('Z', _consoleZ, (v) => _consoleZ = v)),
                  ],
                ),
              ],

              const Divider(),

              // NBT进度显示
              _buildSectionTitle('显示选项'),
              SwitchListTile(
                title: const Text('显示NBT导入进度'),
                value: _showNBTProgress,
                onChanged: (v) => setState(() => _showNBTProgress = v),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('添加'),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildIntField(String label, int initialValue, Function(int) onChanged) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue.toString(),
      keyboardType: TextInputType.number,
      onChanged: (v) {
        final val = int.tryParse(v);
        if (val != null) onChanged(val);
      },
      validator: (v) {
        if (v == null || v.isEmpty) return '请输入数值';
        if (int.tryParse(v) == null) return '请输入有效数字';
        return null;
      },
    );
  }

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        dialogTitle: '选择构建文件',
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final path = result.files.single.path;
        if (path != null && path.isNotEmpty) {
          setState(() {
            _filePath = path;
          });
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('选择文件失败: $e')),
      );
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    if (_filePath.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请选择构建文件')),
      );
      return;
    }

    final buildTask = BuildTask()
      ..taskType = 'build'
      ..filePath = _filePath
      ..startPos = (BlockPos()
        ..x = _startX
        ..y = _startY
        ..z = _startZ)
      ..speed = _speed
      ..autoCleanBlock = _autoCleanBlock
      ..autoCleanItem = _autoCleanItem
      ..verifyAfterChunk = _verifyAfterChunk
      ..verifyChunkLevel = _verifyChunkLevel
      ..progress = _progress
      ..autoDisableCommand = _autoDisableCommand
      ..autoUpgradeCommand = _autoUpgradeCommand
      ..ignoreCommandBlock = _ignoreCommandBlock
      ..ignoreOtherNbtBlock = _ignoreOtherNBTBlock
      ..consoleWorldPos = (BlockPos()
        ..x = _consoleX
        ..y = _consoleY
        ..z = _consoleZ)
      ..showNbtProgress = _showNBTProgress;

    Navigator.pop(context, buildTask);
  }
}

/// 导出任务配置对话框
class ExportTaskDialog extends StatefulWidget {
  final ExportTask? initialTask;

  const ExportTaskDialog({super.key, this.initialTask});

  @override
  State<ExportTaskDialog> createState() => _ExportTaskDialogState();
}

class _ExportTaskDialogState extends State<ExportTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _filePathController = TextEditingController();

  String _filePath = '';
  String _fileType = 'mcworld';
  int _startX = 0, _startY = 0, _startZ = 0;
  int _endX = 0, _endY = 0, _endZ = 0;

  // 文件路径输入方式
  bool _useManualInput = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialTask != null) {
      final task = widget.initialTask!;
      _filePath = task.filePath;
      _filePathController.text = task.filePath;
      _fileType = task.fileType;
      _startX = task.startPos.x;
      _startY = task.startPos.y;
      _startZ = task.startPos.z;
      _endX = task.endPos.x;
      _endY = task.endPos.y;
      _endZ = task.endPos.z;
    }
  }

  @override
  void dispose() {
    _filePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('配置导出任务'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 文件选择
              _buildSectionTitle('导出文件'),
              Row(
                children: [
                  Expanded(
                    child: _useManualInput
                        ? TextField(
                            controller: _filePathController,
                            decoration: const InputDecoration(
                              labelText: '文件路径',
                              hintText: '输入完整文件路径',
                            ),
                            onChanged: (v) => _filePath = v,
                          )
                        : ListTile(
                            title: Text(_filePath.isEmpty ? '选择导出路径' : _filePath),
                            trailing: const Icon(Icons.folder_open),
                            onTap: _pickFile,
                          ),
                  ),
                  IconButton(
                    icon: Icon(_useManualInput ? Icons.folder_open : Icons.edit),
                    tooltip: _useManualInput ? '浏览文件' : '手动输入',
                    onPressed: () {
                      setState(() {
                        _useManualInput = !_useManualInput;
                        if (!_useManualInput) {
                          _filePathController.text = _filePath;
                        }
                      });
                    },
                  ),
                ],
              ),

              const Divider(),

              // 文件类型
              _buildSectionTitle('文件类型'),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: '导出格式'),
                initialValue: _fileType,
                items: const [
                  DropdownMenuItem(value: 'mcworld', child: Text('mcworld')),
                ],
                onChanged: (v) => setState(() => _fileType = v!),
              ),

              const Divider(),

              // 起始坐标
              _buildSectionTitle('起始坐标'),
              Row(
                children: [
                  Expanded(child: _buildIntField('X', _startX, (v) => _startX = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Y', _startY, (v) => _startY = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Z', _startZ, (v) => _startZ = v)),
                ],
              ),

              const Divider(),

              // 终止坐标
              _buildSectionTitle('终止坐标'),
              Row(
                children: [
                  Expanded(child: _buildIntField('X', _endX, (v) => _endX = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Y', _endY, (v) => _endY = v)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildIntField('Z', _endZ, (v) => _endZ = v)),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('添加'),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildIntField(String label, int initialValue, Function(int) onChanged) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue.toString(),
      keyboardType: TextInputType.number,
      onChanged: (v) {
        final val = int.tryParse(v);
        if (val != null) onChanged(val);
      },
      validator: (v) {
        if (v == null || v.isEmpty) return '请输入数值';
        if (int.tryParse(v) == null) return '请输入有效数字';
        return null;
      },
    );
  }

  Future<void> _pickFile() async {
    try {
      // 由于saveFile在某些平台可能不支持，使用getDirectoryPath + 手动输入文件名
      final result = await FilePicker.platform.getDirectoryPath(
        dialogTitle: '选择导出目录',
      );

      if (result != null && result.isNotEmpty) {
        // 显示文件名输入对话框
        if (!mounted) return;
        final fileName = await showDialog<String>(
          context: context,
          builder: (context) {
            final controller = TextEditingController(text: 'export.mcworld');
            return AlertDialog(
              title: const Text('输入文件名'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: '文件名',
                  hintText: 'export.mcworld',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, controller.text),
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );

        if (fileName != null && fileName.isNotEmpty) {
          setState(() {
            _filePath = '$result/$fileName';
          });
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('选择目录失败: $e')),
      );
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    if (_filePath.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请选择导出路径')),
      );
      return;
    }

    final exportTask = ExportTask()
      ..taskType = 'export'
      ..filePath = _filePath
      ..fileType = _fileType
      ..startPos = (BlockPos()
        ..x = _startX
        ..y = _startY
        ..z = _startZ)
      ..endPos = (BlockPos()
        ..x = _endX
        ..y = _endY
        ..z = _endZ);

    Navigator.pop(context, exportTask);
  }
}
