#!/bin/bash


function Run_SSH {
while : ; do
    #sleep 2s
    sshpass -p 'winner' ssh -p 2221 root@localhost exit
    if [ $? == 0 ]; then
            clear
            echo " ▓▓▓▓▓▓▓▓▓ Tarefas ▓▓▓▓▓▓▓▓▓▓▓" 
            echo " ✔ VirtualBox UP              " 
            echo " ✔ VM UP                      "
            echo " ↻ Conexao SSH UP             "
            sleep 5
    fi
            clear
            echo " ▓▓▓▓▓▓▓▓▓ Tarefas ▓▓▓▓▓▓▓▓▓▓▓" 
            echo " ✔ VirtualBox UP              " 
            echo " ✔ VM UP                      "
            echo " ✔ Conexao SSH UP             "
            sleep 2
            Run_Start
done
}



function Run_VM {
while : ; do
        #sleep 2s
        #eval "$@"
        #local status=$?
        
    if vboxmanage showvminfo "ambiente_teste" | grep -c "running (since" > /dev/null; then
       Run_SSH
    else
           clear
           echo " ▓▓▓▓▓▓▓▓▓ Tarefas ▓▓▓▓▓▓▓▓▓▓▓" 
           echo " ✔ VirtualBox UP              " 
           echo " ↻ VM UP                      "
           echo " ✘ Conexao SSH UP             "
           sleep 5
    
           
fi        
        
        
done

# caso precise para matar os processos
# killall iniciar.sh

}

function Run_Start {
clear
sshpass -p 'winner' ssh -p 2221 root@localhost
exit
}

function stop {
clear
echo " ✘ VM Down                      "
vboxmanage controlvm ambiente_teste poweroff soft
exit
}


function inicial {

if vboxmanage showvminfo "ambiente_teste" | grep -c "running (since" > /dev/null; then
    Run_Start
else

clear
VBoxManage startvm ambiente_teste --type headless > /dev/null
echo " ▓▓▓▓▓▓▓▓▓ Tarefas ▓▓▓▓▓▓▓▓▓▓▓" 
echo " ↻ VirtualBox UP              " 
echo " ✘ VM UP                      "
echo " ✘ Conexao SSH UP             "
    Run_VM
fi

}

inicial


