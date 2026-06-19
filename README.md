# Linux Practice

Сборник bash-скриптов для практики Linux и автоматизации.

## Содержимое

- `backup.sh` — скрипт бэкапа папок с логированием
- `deploy.sh` — деплой backup-скрипта на удалённый сервер через SSH
- `health_check.sh` — проверка состояния сервера
- `vars.sh`, `conditions.sh`, `loops.sh`, `functions.sh` — учебные скрипты

## Использование

### Бэкап
\`\`\`bash
./backup.sh ~/projects
\`\`\`

Создаёт архив в `~/backups/backup_DATE.tar.gz` и пишет в лог.

### Деплой на сервер
\`\`\`bash
./deploy.sh
\`\`\`

Копирует `backup.sh` на сервер `myserver`, запускает его и забирает лог.

## Технологии

- Bash
- SSH / SCP
- tar / gzip
- cron (для автоматизации)
