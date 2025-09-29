#!/bin/bash
set -euo pipefail

# Установка базовых утилит
apt-get install -y git python3-pip curl wget ufw nginx

# Установка Docker, если он еще не установлен
if ! command -v docker &> /dev/null
then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
fi

# Установка Fastfetch
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.11.2/fastfetch-linux-amd64.deb -O fastfetch.deb
dpkg -i fastfetch.deb
apt-get install -f -y
rm fastfetch.deb