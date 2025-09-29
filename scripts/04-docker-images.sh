#!/bin/bash
set -euo pipefail

# Создаем родительскую директорию и переходим в нее
mkdir -p /root/Images
cd /root/Images

# 1. Hikka
echo "--- Сборка Hikka ---"
git clone https://github.com/beveiled/hikka Hikka
docker build -t hikka ./Hikka

# 2. Heroku
echo "--- Сборка Heroku ---"
git clone https://github.com/coddrago/Heroku Heroku
docker build -t heroku ./Heroku

# 3. RewHeroku
echo "--- Сборка RewHeroku ---"
git clone https://github.com/Rewixx-png/RewHeroku RewHeroku
docker build -t topkasoso ./RewHeroku