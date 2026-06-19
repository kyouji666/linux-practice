#!/bin/bash

SOURCE=$1
DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR=~/backups
LOG_DIR=~/backups/backups.log

if [ -z "$SOURCE" ]; then
    echo "Ошибка: укажи папку для бэкапа"
    echo "Пример: ./backup.sh ~/projects"
    exit 1
fi

if [ ! -d "$SOURCE" ]; then
    echo "Ошибка: папка '$SOURCE' не существует"
    exit 1
fi


mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname $SOURCE)" "$(basename $SOURCE)"


if [ $? -eq 0 ]; then
    SIZE=$(du -sh "$BACKUP_FILE" | cut -f1)
    echo "Бэкап создан: $BACKUP_FILE" >> "$LOG_DIR"
    echo "Размер: $(du -sh $BACKUP_FILE | cut -f1)" >> "$LOG_DIR"
    echo "$DATE | $(basename $SOURCE) | $SIZE | SUCCESS" >> "$LOG_DIR"
else
    echo "Ошибка при создании бэкапа" >> "$LOG_DIR"
    echo "$DATE | $(basename $SOURCE) | - | FAILED" >> "$LOG_DIR"
    exit 1
fi

echo "Всего бэкапов: $(ls $BACKUP_DIR/*.tar.gz | wc -l)"

find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete
