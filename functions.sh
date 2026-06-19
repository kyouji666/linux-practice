#!/bin/bash

say_hello() {
    local NAME=$1
    echo "Hello, $NAME!"
}

check_file() {
    local FILE=$1
    if [ -f "$FILE" ]; then
        echo "file $FILE is created"
    else
        echo "File $FILE not found"
    fi
}

say_hello "Kyouji"
say_hello "Linux"
check_file "notes.txt"
check_file "несуществующий.txt"
