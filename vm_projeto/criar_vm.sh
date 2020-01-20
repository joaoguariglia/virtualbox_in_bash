#!/bin/bash
#MACHINENAME=teste



# Verifica se a maquina existe
if [ ! -f ./teste.criado ]; then
   
   #Create VM
VBoxManage createvm --name teste --ostype "Debian_64" --register --basefolder `pwd`
#Set memory and network
VBoxManage modifyvm teste --ioapic on
VBoxManage modifyvm teste --memory 1024 --vram 128
VBoxManage modifyvm teste --nic1 nat
#Create Disk and connect Debian Iso
VBoxManage createhd --filename `pwd`/teste/teste_disk.vdi --size 80000 --format VDI
VBoxManage storagectl teste --name "SATA Controller" --add sata --controller IntelAhci 
VBoxManage storageattach teste --storagectl SATA --port 0 --device 0 --type hdd --medium `pwd`/teste/teste_disk.vdi
VBoxManage storageattach teste --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/teste/teste_disk.vdi

VBoxManage storagectl teste --name "IDE Controller" --add ide --controller PIIX4       
VBoxManage storageattach teste --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium /home/suporte/Downloads/mini.iso       
VBoxManage modifyvm teste --boot1 dvd --boot2 disk --boot3 none --boot4 none 

VBoxManage modifyvm teste --boot1 dvd --boot2 disk --boot3 none --boot4 none

#Enable RDP
VBoxManage modifyvm teste --vrde on
VBoxManage modifyvm teste --vrdemulticon on --vrdeport 10001

# cria controle
touch ./teste.criado

fi

#Start a VM com console
VBoxManage startvm teste --type headless
rdesktop-vrdp localhost:10001


# Start a VM sem console
# VBoxHeadless --startvm teste


