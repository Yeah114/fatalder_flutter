# 中文字体配置说明

## 问题
Flutter Linux 应用默认不包含中文字体，导致中文显示为方块或乱码。

## 解决方案

### 1. 字体文件
已将 Noto Sans CJK SC 字体复制到项目中：
- `fonts/NotoSansSC-Regular.ttc` (19MB)
- `fonts/NotoSansSC-Bold.ttc` (20MB)

### 2. 配置文件

#### pubspec.yaml
```yaml
flutter:
  fonts:
    - family: NotoSansSC
      fonts:
        - asset: fonts/NotoSansSC-Regular.ttc
        - asset: fonts/NotoSansSC-Bold.ttc
          weight: 700
```

#### lib/main.dart
```dart
theme: ThemeData(
  fontFamily: 'NotoSansSC',
  // ...
),
```

### 3. 运行方式

#### 方式 1: 使用启动脚本（推荐）
```bash
cd /root/fatalder_flutter
./run.sh
```

启动脚本会自动设置中文环境变量。

#### 方式 2: Flutter 开发模式
```bash
cd /root/fatalder_flutter
export LANG=zh_CN.UTF-8
flutter run -d linux
```

#### 方式 3: 直接运行二进制
```bash
cd /root/fatalder_flutter
export LANG=zh_CN.UTF-8
./build/linux/arm64/release/bundle/fatalder_flutter
```

### 4. 验证字体

启动应用后，你应该能看到：
- ✅ 导航栏：概览、服务器、任务、设置
- ✅ 快捷操作卡片的中文文字
- ✅ 对话框和提示信息

如果仍然显示方块：
1. 确保字体文件存在于 `fonts/` 目录
2. 重新构建：`flutter clean && flutter build linux --release`
3. 检查系统 locale：`locale -a | grep zh`

### 5. 字体文件大小

由于包含了完整的 CJK (中日韩) 字体，字体文件较大：
- 总大小：约 39MB
- 如果需要减小体积，可以使用字体子集化工具

### 6. 字体来源

使用的是 Google Noto Sans CJK SC（思源黑体简体中文版本）：
- 开源免费
- 支持完整的中文字符集
- 系统路径：`/usr/share/fonts/opentype/noto/`

## 构建配置

完整构建命令：
```bash
cd /root/Fatalder
make flutter-build-linux
```

这会自动：
1. 构建 gRPC 服务
2. 复制二进制到 Flutter assets
3. 包含中文字体
4. 构建 Linux 应用

## 故障排除

### 字体不显示
```bash
# 检查字体文件
ls -lh fonts/

# 清理并重建
flutter clean
flutter pub get
flutter build linux --release
```

### 环境变量
确保设置了中文 locale：
```bash
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
```

### 系统字体
如果不想包含字体文件，可以依赖系统字体：
1. 安装系统字体：`apt install fonts-noto-cjk`
2. 修改 `main.dart` 使用系统字体名称
3. 不在 pubspec.yaml 中定义字体

---

**最后更新**: 2025-10-02
**字体版本**: Noto Sans CJK SC (Google Noto)
