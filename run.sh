#!/bin/bash

# Fatalder Flutter 启动脚本
# 确保中文字体正确加载

cd "$(dirname "$0")"

# 设置环境变量以支持中文
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# 运行应用
if [ -f "build/linux/arm64/release/bundle/fatalder_flutter" ]; then
    echo "🚀 启动 Fatalder (Release 模式)..."
    ./build/linux/arm64/release/bundle/fatalder_flutter
elif [ -f "build/linux/arm64/debug/bundle/fatalder_flutter" ]; then
    echo "🚀 启动 Fatalder (Debug 模式)..."
    ./build/linux/arm64/debug/bundle/fatalder_flutter
else
    echo "❌ 错误: 找不到可执行文件"
    echo "请先运行: flutter build linux --release"
    exit 1
fi
