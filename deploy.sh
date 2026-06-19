#!/bin/bash

scp ~/projects/linux-practice/backup.sh myserver:~/

ssh myserver "chmod +x ~/backup.sh && ~/backup.sh /home/devops"

scp myserver:~/backups/backups.log ./server-backup.log

echo "Готово! Лог сохранён как server-backup.log"

cat server-backup.log


