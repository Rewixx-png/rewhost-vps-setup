#!/bin/bash
set -euo pipefail

# Удаляем стандартные приветствия Ubuntu для чистоты вывода
rm -f /etc/update-motd.d/10-help-text
rm -f /etc/update-motd.d/50-motd-news

# Создаем наш кастомный скрипт
cat << 'EOF' > /etc/update-motd.d/05-rewhost-stats
#!/bin/bash
echo ""
/usr/bin/fastfetch
echo ""
echo "-----------------------------------------------------"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
echo "  Нагрузка на CPU: $CPU_USAGE"
echo "  Занято на диске: $DISK_USAGE"
echo "-----------------------------------------------------"
echo ""
EOF

# Делаем его исполняемым
chmod +x /etc/update-motd.d/05-rewhost-stats