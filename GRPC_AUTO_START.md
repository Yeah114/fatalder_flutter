# gRPC 自动启动功能

## 功能说明

Flutter 应用现在会在启动时**自动启动** gRPC 后端服务，并实现智能端口管理。

## 核心特性

### 1. 自动启动 gRPC 服务

当你运行 Flutter 应用时，应用会自动：
- 查找 `fatalder-grpc` 二进制文件
- 启动 gRPC 后端进程
- 连接到 gRPC 服务
- 如果失败，显示错误并提供重试按钮

### 2. 动态端口分配

**默认起始端口**: `12465`

**端口冲突处理**:
- 如果端口 `12465` 被占用，自动尝试 `12466`
- 如果端口 `12466` 被占用，自动尝试 `12467`
- 依此类推，最多尝试 100 个端口（`12465-12564`）

**日志示例**:
```
Found available port: 12465
Using gRPC binary at: /root/fatalder_flutter/assets/fatalder-grpc
Starting gRPC server on port 12465...
✅ gRPC server started on port 12465
Connected to gRPC server at localhost:12465
```

如果端口被占用：
```
Port 12465 is in use, trying next...
Port 12466 is in use, trying next...
Found available port: 12467
✅ gRPC server started on port 12467
```

### 3. 进程管理

- **自动清理**: 应用退出时自动停止 gRPC 服务进程
- **输出监控**: gRPC 服务的 stdout/stderr 会显示在 Flutter 控制台
- **进程监控**: 如果 gRPC 进程崩溃，会自动检测并记录

## 使用方法

### 方式 1: 使用 Makefile（推荐）

```bash
# 在项目根目录
cd /root/Fatalder

# 构建并运行 Flutter 应用（自动构建 gRPC）
make flutter-run-linux
```

这会：
1. 构建 gRPC 服务器
2. 复制二进制文件到 Flutter assets
3. 启动 Flutter 应用
4. Flutter 应用自动启动 gRPC 后端

### 方式 2: 直接运行 Flutter

```bash
cd /root/fatalder_flutter
flutter run -d linux
```

**前提条件**:
- `assets/fatalder-grpc` 文件已存在
- 可以先运行 `cd /root/Fatalder && make grpc-build`

### 方式 3: 构建 Release 版本

```bash
cd /root/Fatalder
make flutter-build-linux
```

生成的可执行文件位于:
```
/root/fatalder_flutter/build/linux/arm64/release/bundle/fatalder_flutter
```

## 二进制文件查找路径

Flutter 应用会按以下顺序查找 gRPC 二进制文件：

1. `<current_dir>/assets/fatalder-grpc` (开发环境)
2. `<current_dir>/data/flutter_assets/assets/fatalder-grpc` (发布环境)
3. `<app_documents_dir>/fatalder-grpc` (备用路径)

如果在 assets 目录找到文件，会自动设置执行权限。

## 测试端口自动递增

运行测试脚本：

```bash
# 占用端口 12465 并测试 Flutter 应用是否会使用 12466
bash /root/test_port_increment.sh
```

然后在另一个终端运行：
```bash
cd /root/fatalder_flutter
flutter run -d linux
```

观察日志输出，应该看到端口自动递增到 12466。

## 日志和调试

### 查看 gRPC 服务输出

gRPC 服务的所有输出会显示在 Flutter 控制台，前缀为：
```
gRPC server: <stdout内容>
gRPC server error: <stderr内容>
```

### 查看当前使用的端口

Flutter 应用启动后，日志会显示：
```
✅ gRPC server started on port <端口号>
Connected to gRPC server at localhost:<端口号>
```

### 常见错误

#### 1. 二进制文件不存在
```
❌ Failed to start server: fatalder-grpc binary not found in:
  - /root/fatalder_flutter/assets/fatalder-grpc
  - ...
```

**解决**: 运行 `make grpc-build` 并确保二进制文件被复制到 assets 目录

#### 2. 端口全部被占用
```
Exception: No available port found in range 12465-12564
```

**解决**: 释放一些端口或修改代码中的端口范围

#### 3. 权限不足
```
ProcessException: Permission denied
```

**解决**: 确保二进制文件有执行权限：
```bash
chmod +x /root/fatalder_flutter/assets/fatalder-grpc
```

## 代码位置

核心实现在 `lib/services/grpc_service.dart`:

- `_findAvailablePort()`: 查找可用端口（从 12465 开始）
- `_isPortAvailable()`: 检查端口是否可用
- `_getGrpcBinaryPath()`: 查找 gRPC 二进制文件
- `startServer()`: 启动 gRPC 服务进程
- `initialize()`: 初始化流程（启动服务 + 连接）

## 版本信息

- 默认端口: `12465`
- 端口范围: `12465-12564` (100 个端口)
- 启动延迟: 2 秒
- 最后更新: 2025-10-02
