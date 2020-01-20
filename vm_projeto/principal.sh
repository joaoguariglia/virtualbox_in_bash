#!/bin/bash

## Caminho do tema das cores
export DIALOGRC=../tema/tema.custom
## Arquivo do tema das cores dentro do caminha acima
DIALOGRC=../tema/tema.custom
## tira o ctrl+c
trap '' INT TSTP
## tira o esc
xmodmap -e 'keycode 9=NoSymbol'

cmd=(dialog --no-cancel --keep-tite --menu "Selecione as Opcoes:" 22 76 16)


options=(1 "Criar VM"
         2 "Backups"
         3 "Status"
         4 "Ações"
         5 "Modifcar"
         6 "Sair")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            ../criar/criar.sh
            
            ;;
        2)
            ./teste1.sh
            ;;
        3)
            echo "Third Option"
            
            ;;
        4)
            echo "Fourth Option"
            ;;
        5)
            dialog --backtitle "Dialog Form Example" --title "Dialog - Form" \
            --form "\nDialog Sample Label and Values" 25 60 16 \
            "Input A:" 1 1 "Value 1" 1 25 25 30 \
            "Input B:" 2 1 "Value 2" 2 25 25 30 \
            "Input C:" 3 1 "Value 3" 3 25 25 30 \
            "Input D:" 4 1 "Value 4" 4 25 25 30 \
             2>/test
            ;;
        6)
            ## voltar o esc
            xmodmap -e "keycode 9 = Escape"
            ## volta a CTRl+C
            trap - INT
            exit
            ;;
    esac
done
