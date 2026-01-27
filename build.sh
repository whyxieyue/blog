#!/bin/sh

# EdgeOne Pages Hugo构建脚本
set -e

echo "开始构建Hugo网站..."

# 下载Hugo二进制文件
echo "下载Hugo..."
wget -q https://github.com/gohugoio/hugo/releases/download/v0.154.5/hugo_extended_0.154.5_linux-amd64.tar.gz

# 解压并设置权限
echo "解压Hugo..."
tar -xzf hugo_extended_0.154.5_linux-amd64.tar.gz

# 直接使用当前目录的hugo
echo "构建网站..."
./hugo --minify

echo "构建完成！"
