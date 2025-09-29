#!/bin/bash
set -euo pipefail # Останавливать скрипт при любой ошибке

# Обновляем список пакетов и сами пакеты
apt-get update -y
apt-get upgrade -y

# Устанавливаем пакеты для русификации
apt-get install -y language-pack-ru locales

# Генерируем и устанавливаем локаль
locale-gen ru_RU.UTF-8
update-locale LANG=ru_RU.UTF-8
export LANG=ru_RU.UTF-8