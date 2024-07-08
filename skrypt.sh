#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date
elif [[ "$1" == "--logs" ]]; then
    num_files=100
    if [[ -n "$2" ]]; then
        num_files=$2
    fi
    for ((i=1; i<=num_files; i++))
    do
        filename="log${i}.txt"
        echo "File name: $filename" > $filename
        echo "Created by: $0" >> $filename
        echo "Date: $(date)" >> $filename
    done
else
    echo "Usage: skrypt.sh --date | --logs [num_files]"
fi

