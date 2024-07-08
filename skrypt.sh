#!/bin/bash

show_help() {
    echo "Usage: skrypt.sh [OPTION]"
    echo "--date        Display the current date"
    echo "--logs [NUM]  Create NUM log files (default: 100)"
    echo "--help        Display this help message"
}

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
elif [[ "$1" == "--help" ]]; then
    show_help
else
    echo "Invalid option. Use --help for usage information."
fi
