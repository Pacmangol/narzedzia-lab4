#!/bin/bash

show_help() {
    echo "Dostępne opcje:"
    echo "--date, -d        Wyświetla dzisiejszą datę"
    echo "--logs, -l [N]    Tworzy N plików logx.txt, domyślnie 100"
    echo "--help, -h        Wyświetla pomoc"
    echo "--init            Klonuje repozytorium i ustawia PATH"
    echo "--error, -e [N]   Tworzy N plików errorx/errorx.txt, domyślnie 100"
    echo "--gitignore       Tworzy plik .gitignore ignorujący pliki log*"
    echo "--tag             Tworzy tag v1.0"
}

create_logs() {
    num_files=${1:-100}
    for ((i=1; i<=num_files; i++))
    do
        echo "log$i.txt" > "log$i.txt"
        echo "Nazwa skryptu: $0" >> "log$i.txt"
        date >> "log$i.txt"
    done
}

create_errors() {
    num_files=${1:-100}
    for ((i=1; i<=num_files; i++))
    do
        mkdir -p "error$i"
        echo "error$i.txt" > "error$i/error$i.txt"
    done
}

create_gitignore() {
    echo "log*" > .gitignore
}

create_tag() {
    git tag v1.0
    git push origin v1.0
}

case "$1" in
    --date|-d)
        date
        ;;
    --logs|-l)
        create_logs $2
        ;;
    --help|-h)
        show_help
        ;;
    --init)
        git clone https://github.com/Pacmangol/narzedzia-lab4.git
        export PATH=$PATH:$(pwd)/narzedzia-lab4
        ;;
    --error|-e)
        create_errors $2
        ;;
    --gitignore)
        create_gitignore
        ;;
    --tag)
        create_tag
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        ;;
esac
