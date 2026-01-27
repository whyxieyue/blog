#!/bin/bash

# EdgeOne Pages专用构建脚本

# 设置Hugo版本
HUGO_VERSION="0.154.5"

# 检查操作系统并下载对应版本
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected, downloading Hugo for Linux..."
    curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" -o hugo.tar.gz
    tar -xzf hugo.tar.gz
    chmod +x hugo
    export PATH=$PATH:$(pwd)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS detected, downloading Hugo for macOS..."
    curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_darwin-universal.tar.gz" -o hugo.tar.gz
    tar -xzf hugo.tar.gz
    chmod +x hugo
    export PATH=$PATH:$(pwd)
else
    echo "Unknown OS: $OSTYPE"
    exit 1
fi

# 验证Hugo
./hugo version

# 构建网站
echo "Building site..."
./hugo --minify --gc

echo "Build successful!"
