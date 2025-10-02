#!/bin/bash

# 设置环境变量以避免GTK/GVFS警告
export NO_AT_BRIDGE=1
export GIO_USE_VFS=local
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/share}"

# 设置字体配置
export FONTCONFIG_FILE=/etc/fonts/fonts.conf
export FONTCONFIG_PATH=/etc/fonts

# 检查是否有DISPLAY设置
if [ -z "$DISPLAY" ]; then
    export DISPLAY=:0
fi

# 运行应用
./build/linux/x64/release/bundle/fatalder_flutter "$@"
