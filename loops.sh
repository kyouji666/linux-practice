#!/bin/bash

# Цикл по списку
for FRUIT in яблоко банан апельсин; do
    echo "Фрукт: $FRUIT"
done

# Цикл по числам
for i in 1 2 3 4 5; do
    echo "Число: $i"
done

# Короткая запись диапазона
for i in {1..5}; do
    echo "Итерация: $i"
done

# Цикл while
COUNT=0
while [ $COUNT -lt 3 ]; do
    echo "Счётчик: $COUNT"
    COUNT=$((COUNT + 1))   # математика в bash — двойные скобки
done
