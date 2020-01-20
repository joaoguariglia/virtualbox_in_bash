#!/bin/bash

## Faz a mesma coisa
# vboxmanage showvminfo "teste" | grep -c "running (since"
# VBoxManage list runningvms | sed -r 's/^"(.*)".*$/\1/' | grep 'teste' | wc -l

# Desligar a vm
# vboxmanage controlvm teste poweroff soft
# Forca desligar
# VBoxManage controlvm teste acpipowerbutton

verde='\033[1;32m'
vermelho='\033[1;31m'
wipe="\033[0;33m"


if vboxmanage showvminfo "teste" | grep -c "running (since" > /dev/null; then
    echo -e "$wipe ▓▓▓▒▒▒░░░ $verde Vm esta LIGADA $wipe ░░░▒▒▒▓▓▓"
else
    echo -e "$wipe ▓▓▓▒▒▒░░░ $vermelho Vm esta DESLIGADA $wipe ░░░▒▒▒▓▓▓"
    # echo -e "Output a $yellow coloured $wipe word."
fi
