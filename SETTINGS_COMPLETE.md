# 设置页面完整功能说明

## 概览

参考 `cmd/cli/framework_config.go`，完整实现了框架配置的图形化界面。

## 功能清单

### 1. 连接状态显示 ✅
- 实时显示 gRPC 连接状态
- 显示当前使用的端口号
- 绿色表示已连接，红色表示未连接

### 2. 框架配置 ✅

#### 语言设置
- **支持语言**: 简体中文 (zh) / English (en)
- **UI**: 单选对话框
- **保存**: 实时生效

#### 存储路径
- **功能**: 选择数据存储目录
- **UI**: 系统文件选择器
- **验证**: 自动创建目录（如果不存在）

#### GitHub 源
- **功能**: 设置 GitHub 基础 URL
- **默认值**: `https://github.com`
- **用途**: 用于下载更新和插件

### 3. 构建任务配置 ✅

#### 单次解析区块数 (MinOnceParseChunkNum)
- **作用**: 控制每次解析的区块数量
- **默认值**: 512
- **影响**:
  - 值越大：解析速度越快，但内存占用越高
  - 值越小：内存占用少，但解析较慢
- **验证**: 必须 > 0

#### 最小匹配度 (MinMatchingDegree)
- **作用**: 区块匹配的最小百分比
- **默认值**: 90.0%
- **范围**: 0-100
- **影响**:
  - 值越高：构建质量越好，但可能导致某些区块无法放置
  - 值越低：放置成功率高，但质量可能下降
- **验证**: 0 ≤ value ≤ 100

#### 最大修补深度 (MaxFixDepth)
- **作用**: 自动修补区块的最大尝试次数
- **默认值**: 5
- **影响**:
  - 值越大：修补成功率越高，但耗时越长
  - 值越小：耗时短，但可能有未修复的区块
- **验证**: 必须 > 0

### 4. 用户中心配置 ✅

#### 用户中心地址 (BaseRoot)
- **功能**: 设置用户中心 API 地址
- **默认值**: `https://fatalder.yeah114.top`
- **UI**: 文本输入框

#### API 密钥 (APIKey)
- **功能**: 用户中心认证密钥
- **显示**: 自动脱敏（`****`显示前4位和后4位）
- **UI**: 密码输入框，支持显示/隐藏切换
- **用途**: 访问用户中心服务

### 5. 应用信息 ✅

#### 关于对话框
- 应用名称：Fatalder
- 版本号：1.0.0
- 描述：Minecraft Bedrock 世界管理工具
- 显示当前 gRPC 端口

#### 开源许可
- 显示所有依赖库的许可证信息
- 使用 Flutter 内置的 LicensePage

### 6. 高级功能 ✅

#### 重启 gRPC 服务
- **功能**: 重启后台 gRPC 服务进程
- **警告**: 正在进行的任务可能会被中断
- **流程**:
  1. 停止当前服务
  2. 等待 1 秒
  3. 重新启动并连接
- **反馈**: 成功/失败提示

#### 清除所有数据
- **功能**: 删除所有配置和任务数据
- **警告**: 不可恢复
- **状态**: 待实现（占位）

## 配置保存逻辑

### 更新流程
```
用户修改配置
    ↓
构建完整的 FrameworkConfig 对象
    ↓
调用 gRPC: updateFrameworkConfig()
    ↓
更新本地 AppState
    ↓
显示成功/失败提示
```

### 数据结构

```dart
FrameworkConfig {
  language: String,           // 语言代码
  storagePath: String,        // 存储路径
  githubBaseUrl: String,      // GitHub 源
  buildConfig: BuildTaskConfig {
    minOnceParseChunkNum: int,   // 单次解析区块数
    minMatchingDegree: double,   // 最小匹配度
    maxFixDepth: int,            // 最大修补深度
  },
  userCenterConfig: UserCenterConfig {
    baseRoot: String,          // 用户中心地址
    apiKey: String,            // API 密钥
  },
}
```

## 对应的 CLI 实现

### CLI 命令
```bash
fatalder-cli
  └── 框架配置
      ├── 修改语言设置
      ├── 修改存储路径
      ├── 修改构建任务配置
      │   ├── 单次解析区块数最小值
      │   ├── 匹配度最小值
      │   └── 最大修补深度
      ├── 修改更新配置 (GitHub源)
      ├── 配置 API Key
      ├── 重置配置
      └── 返回
```

### 代码对应关系

| Flutter UI | CLI 函数 |
|-----------|---------|
| 语言选择 | `changeLanguage()` |
| 存储路径 | `changeStoragePath()` |
| GitHub源 | `manageUpdateConfig()` |
| 用户中心配置 | `manageUserCenterConfig()` |
| 单次解析区块数 | `changeMinOnceParseChunkNum()` |
| 最小匹配度 | `changeMinMatchingDegree()` |
| 最大修补深度 | `changeMaxFixDepth()` |
| 重置配置 | `resetFrameworkConfig()` |

## UI 设计

### 卡片式布局
- 每个配置分类使用独立的 Card
- 清晰的分组标题
- 一致的 ListTile 设计

### 交互方式
- **点击**: 打开编辑对话框
- **图标**:
  - 左侧：功能图标
  - 右侧：编辑/箭头图标
- **颜色**:
  - 普通设置：白色/深色卡片
  - 危险操作：红色背景

### 输入验证
- 实时验证输入值
- 范围检查
- 类型检查（整数/浮点数）
- 错误提示使用 SnackBar

## 国际化支持

虽然当前界面是中文，但配置支持：
- 语言切换（zh/en）
- 后端根据配置返回对应语言的消息

## 错误处理

### 保存失败
```dart
catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('保存失败: $e')),
  );
}
```

### 输入验证
- 范围检查：`if (value < 0 || value > 100)`
- 类型检查：`int.tryParse()` / `double.tryParse()`
- 非空检查：`if (value == null)`

## 使用示例

### 修改单次解析区块数
1. 进入设置页面
2. 点击"构建任务配置" → "单次解析区块数"
3. 输入新值（如：1024）
4. 点击"保存"
5. 系统显示"配置已保存"

### 配置 API 密钥
1. 进入设置页面
2. 点击"用户中心" → "API 密钥"
3. 点击眼睛图标显示/隐藏
4. 输入密钥
5. 点击"保存"

## 最佳实践

### 推荐配置值

#### 高性能服务器
- 单次解析区块数: 1024
- 最小匹配度: 95.0%
- 最大修补深度: 10

#### 普通服务器
- 单次解析区块数: 512 (默认)
- 最小匹配度: 90.0% (默认)
- 最大修补深度: 5 (默认)

#### 低内存设备
- 单次解析区块数: 256
- 最小匹配度: 85.0%
- 最大修补深度: 3

## 技术栈

- **UI Framework**: Flutter Material 3
- **状态管理**: Provider
- **RPC**: gRPC
- **文件选择**: file_picker
- **表单验证**: 手动实现

## 完成度

- ✅ 所有 CLI 功能已实现
- ✅ 完整的输入验证
- ✅ 错误处理和提示
- ✅ 中文界面和说明
- ✅ 实时保存和同步
- ⏳ 清除数据功能（待实现）

---

**创建时间**: 2025-10-02
**参考实现**: `/root/Fatalder/cmd/cli/framework_config.go`
**UI 文件**: `/root/fatalder_flutter/lib/screens/settings_screen.dart`
