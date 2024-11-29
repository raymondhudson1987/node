#!/bin/bash

# 设置变量
VERSION="1.8.2"
PORT="59109"
DOWNLOAD_URL="https://github.com/prometheus/node_exporter/releases/download/v$VERSION/node_exporter-$VERSION.linux-amd64.tar.gz"
TAR_FILE="node_exporter-$VERSION.linux-amd64.tar.gz"
DIR_NAME="node_exporter-$VERSION.linux-amd64"

# 下载 node_exporter
echo "Downloading node_exporter version $VERSION..."
wget $DOWNLOAD_URL -O $TAR_FILE

# 解压文件
echo "Extracting $TAR_FILE..."
tar -xvzf $TAR_FILE

# 进入目录
cd $DIR_NAME

# 启动 node_exporter
echo "Starting node_exporter on port $PORT..."
nohup ./node_exporter --web.listen-address=":$PORT" &

# 提示用户
echo "node_exporter is running in the background on port $PORT."
