#!/bin/bash

THRESHOLD=80

df -h

USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $USAGE -ge $THRESHOLD ]; then
   echo "ВНИМАНИЕ: Раздел \"$partition\" заполнен на $usep%."
fi

du -sh /home/* | sort -rh | head -5
