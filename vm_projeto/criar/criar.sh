#!/bin/bash
## Caminho do tema das cores
export DIALOGRC=../tema/tema.custom
## Arquivo do tema das cores dentro do caminha acima
DIALOGRC=../tema/tema.custom
## tira o ctrl+c
#trap '' INT TSTP
## tira o esc
#xmodmap -e 'keycode 9=NoSymbol'

## variaveis
nome_vm=
so_vm=
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
            "S.O(.ISO):" "$so_vm"    \
            "Memoria:" 'Backups'     \
            "Disco:" 'Status'        \
            "[Aplicar]" ''           \
            "[Voltar]" '')

    # Ela apertou CANCELAR ou ESC, então vamos sair...
    #[ $? -ne 0 ] && break

    # De acordo com a opção escolhida, dispara programas
    case "$resposta" in
         "Nome da VM:") criar_nome ;;
         "S.O(.ISO):") criar_so ;;
         "Memoria:") /usr/games/solitaire ;;
         "Disco:") /usr/X11R6/bin/xsnow ; /usr/X11R6/bin/xeyes ;;
         "[Aplicar]") /usr/X11R6/bin/xsnow ; /usr/X11R6/bin/xeyes ;;
         
         "[Voltar]") exit ;;
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
clear
# echo "O seu nome é: $nome"
criar_inicial

}

function criar_so {

cmd=(dialog --no-cancel --no-ok --keep-tite --menu "Memoria:" 22 76 16)
            
options=(1 "Windows 10"
         2 "Windows 2016"
         3 "Linux - Ubuntu - 18.04"
         4 "Linux - Ubuntu - 19.04"
         5 "Linux - Centos - 7"
         6 "Linux - Centos - 8"
         7 "Outros")


choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)


for choice in $choices
do
    case $choice in
        1)
            so_vm="Windows 10"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            
            ;;
        2)
            so_vm="Windows 2016"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            
            ;;
        3)
            so_vm="Ubuntu 18.04"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            
            ;;
        4)
            so_vm="Ubuntu 19.04"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            
            ;;
        5)
            so_vm="Centos 7"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            
            ;;
        6)
            so_vm="Centos 8"
            local="/home/suporte/Downloads/mini.iso"
            clear
            criar_inicial
            echo $local
            exit
            ;;
        7)
        
            vm_so_custom
            
            ;;
    esac
done
}


function vm_so_custom {

source=/home/suporte/Downloads 
            let i=0 # define counting variable
            W=() # define working array
            while read -r line; do # process file by file
            let i=$i+1
             W+=($i "$line")
             done < <( ls -1 $source )
              file_custom_vm=$(dialog --title "List file of directory $source" --menu "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
               clear
               if [ $? -eq 0 ]; then # Exit with OK
                ## Essa linha pega a sua escolha do arquivo e guarda todo o caminho full path dentro da variavel [file_custom_list_vm]
                ## Experimenta da eco que vc vai entender
                file_custom_list_vm=$(readlink -f $source/$(ls -1 $source | sed -n "`echo "$file_custom_vm p" | sed 's/ //'`"))
                ## Essa linha recorta apenas o nome do arquico selecionado para aparecer na tele inicial do menu
                so_vm=$(awk 'END{ var=FILENAME; split (var,a,/\//); print a[5]}' $file_custom_list_vm)
                clear
                criar_inicial
                #echo $so_vm
                
                #criar_so = $file_custom_vm
                #clear
                #criar_inicial
                fi
}




#vm_so_custom
criar_inicial
