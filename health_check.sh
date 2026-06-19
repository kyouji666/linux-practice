#!/bin/bash

SERVER="myserver"

echo "=== Health Check для $SERVER ==="
echo ""

# 1. Доступен ли сервер по SSH
if ssh -o ConnectTimeout=5 $SERVER "exit" 2>/dev/null; then
    echo "✓ SSH: доступен"
else
    echo "✗ SSH: НЕ ДОСТУПЕН"
    exit 1
fi

# 2. Аптайм сервера
echo ""
echo "=== Аптайм ==="
ssh $SERVER "uptime -p"

# 3. Использование памяти
echo ""
echo "=== Память ==="
ssh $SERVER "free -h | head -2"

# 4. Топ-3 процесса по CPU
echo ""
echo "=== Топ процессов ==="
ssh $SERVER "ps aux --sort=-%cpu | head -4"

# 5. Слушающие порты
echo ""
echo "=== Открытые порты ==="
ssh $SERVER "ss -tlnp 2>/dev/null || netstat -tlnp"
