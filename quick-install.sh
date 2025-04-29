#!/bin/bash
set -e

## 克隆仓库到本地
echo "clone repository..."
git clone --depth=1 https://github.com/xiaomifengd/chatgpt-share-server-fox-deploy.git chatgpt-share-server-fox


## 进入目录
cd chatgpt-share-server-fox
# 默认值
DEFAULT_CHATPROXY=""
echo -n "请输入xyhelper网关："
read CHATPROXY < /dev/tty
# 如果用户直接回车，使用默认值
CHATPROXY=${CHATPROXY:-$DEFAULT_CHATPROXY}

# 使用sed替换CHATPROXY值
# 使用 | 作为分隔符，因为URL中包含 /
sed -i "s|CHATPROXY: \".*\"|CHATPROXY: \"$CHATPROXY\"|" docker-compose.yml

# cat docker-compose.yml
# docker compose pull
docker compose up -d --remove-orphans

## 提示信息
echo "服务启动成功，请访问 http://localhost:8300"
echo "管理员后台地址 http://localhost:8300/xyhelper"
echo "管理员账号: admin"
echo "管理员密码: 123456"
echo "对fox 部署使用有任何疑问，请扫描二维码添加作者微信"
echo   "█████████████████████████████████████
█████████████████████████████████████
████ ▄▄▄▄▄ ██▀▄██▀▀▀█▀█▀▀█ ▄▄▄▄▄ ████
████ █   █ █▄▀█▄██  ▄█▄███ █   █ ████
████ █▄▄▄█ ██▄▀▀▄▀  █ █▀▀█ █▄▄▄█ ████
████▄▄▄▄▄▄▄█ █▄█▄▀ █▄▀▄█ █▄▄▄▄▄▄▄████
████   █  ▄ ▄▀█ ▄▄▀▀▀ █▄▄  ██▀▄█▀████
████▀ █▀▀ ▄█▀▀ █▄▀ █▀ █▀▀█ ▄▄█▄ ▄████
████▄▄█ █▄▄▄▀▀ ██▄█   █▄   ██ █▄ ████
████▄ ▀ ▄ ▄ ▀▄▀▀▀▀ ▀▄▀ █▀▀█▄█ █ ▄████
██████▄▀▀▄▄▄▄▄▀▄█▄█▄█ ▀▄   ▄█ ▀▄ ████
████▄▀ █ ▀▄▄▀ ▄██▀ █▀ ▀███▄█▀▀█ ▄████
████▄█▄▄██▄▄▀▄▄█▀█▀   ▀▀ ▄▄▄ █▀▀▀████
████ ▄▄▄▄▄ █ ▀▀█▀ ▄█▀▀▄▄ █▄█  █▄▄████
████ █   █ █▄▀▄▄█ ▀▀▀▄█▀ ▄▄  █▀█ ████
████ █▄▄▄█ █  ▀██▀ █▄▀▀ ▀▄██▄▄█▀▄████
████▄▄▄▄▄▄▄█▄▄██▄▄██████▄█▄▄▄▄█▄▄████
█████████████████████████████████████
█████████████████████████████████████"