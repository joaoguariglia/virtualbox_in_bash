#!/bin/bash
## Caminho do tema das cores
export DIALOGRC=../tema/tema.custom
## Arquivo do tema das cores dentro do caminha acima
DIALOGRC=tema.custom
## tira o ctrl+c
#trap '' INT TSTP
## tira o esc
#xmodmap -e 'keycode 9=NoSymbol'

## variaveis
nome_vm=
memoria_vm=
disco_vm=

function criar_inicial {
#cmd=(dialog --no-cancel --no-ok --keep-tite --menu "Selecione as Opcoes:" 22 76 16)


 resposta=$(
      dialog --stdout               \
             --no-cancel            \
             --no-ok                \
             --keep-tite            \
             --title 'Menu da Tia'  \
             --menu 'Oi Tia, escolha o quê você quer fazer:' \
            0 0 0                    \
            "Nome da VM:" "$nome_vm" \
            "S.O:" 'Backups'         \
            "Memoria:" 'Backups'     \
            "Disco:" 'Status'        \
            "[Aplicar]" ''           \
            "[Voltar]" '')

    # Ela apertou CANCELAR ou ESC, então vamos sair...
    #[ $? -ne 0 ] && break

    # De acordo com a opção escolhida, dispara programas
    case "$resposta" in
         "Nome da VM:") criar_nome ;;
         "S.O:") /bin/mcedit /tmp/carta.txt ;;
         "Memoria:") /usr/games/solitaire ;;
         "Disco:") /usr/X11R6/bin/xsnow ; /usr/X11R6/bin/xeyes ;;
         "[Aplicar]") /usr/X11R6/bin/xsnow ; /usr/X11R6/bin/xeyes ;;
         
         "[Voltar]") break ;;
    esac

#done



}



function criar_memoria {

cmd=(dialog --no-cancel --no-ok --keep-tite --menu "Memoria:" 22 76 16)
            
options=(1 "256 MB"
         2 "512 MB"
         3 "1 GB"
         4 "2 GB"
         5 "4 GB"
         5 "6 GB"
         5 "8 GB"
         5 "12 GB"
         6 "voltar")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)


for choice in $choices
do
    case $choice in
        1)
            dialog --backtitle "Criar - VM" --title "Configurações:" \
            --form "\nTabela de configuração" 25 60 16 \
            "Input A:" 1 1 "Value 1" 1 25 25 30 \
            "Input B:" 2 1 "Value 2" 2 25 25 30 \
            "Input C:" 3 1 "Value 3" 3 25 25 30 \
            "Input D:" 4 1 "Value 4" 4 25 25 30 \
             2>/test
            
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
            echo "Fourth Option"
            ;;
        6)
            ## voltar o esc
            #xmodmap -e "keycode 9 = Escape"
            ## volta a CTRl+C
            #trap - INT
            criar_inicial
            #exit
            ;;
    esac
done
}


#criar_inicial
#criar_memoria

function criar_nome {

nome_vm=$( dialog --stdout --inputbox 'Digite seu nome:' 0 0 )
# echo "O seu nome é: $nome"
criar_inicial

}
#criar_nome
criar_inicial
