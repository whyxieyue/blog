#!/bin/bash

# EdgeOne Pages构建脚本

# 下载并安装Hugo
echo "Installing Hugo..."
wget -q https://github.com/gohugoio/hugo/releases/download/v0.154.5/hugo_extended_0.154.5_linux-amd64.tar.gz
tar -xzf hugo_extended_0.154.5_linux-amd64.tar.gz
chmod +x hugo
mv hugo /usr/local/bin/hugo

# 清理下载文件
rm hugo_extended_0.154.5_linux-amd64.tar.gz

# 验证Hugo安装
echo "Hugo version:"
hugo version

# 构建网站
echo "Building Hugo site..."
hugo --minify

echo "Build completed!"
