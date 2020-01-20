#!/bin/sh
# File: d:/home/john/tmp/phone.sh
# Date: Thu 28 Feb 2002 10:35:24 Eastern Standard Time
# Last Revised: Time-stamp: <2002-11-18 18:23:10 john> maintained by emacs
# Description: Master script for phone book program
# ======================================================================= 

# Name of address book
BOOK="address-book.txt"

exit=0

while [ $exit -ne 1 ]
do
    echo "What operation do you want?"
    echo -e "add, list, find, del, exit: "
    read answer

    if [ "$answer" = "add" ]
    then
	./add.sh
    elif [ "$answer" = "list" ]
    then
	./list.sh
    elif [ "$answer" = "find" ]
    then
	./find.sh
    elif [ "$answer" = "del" ]
    then
	./del.sh
    elif [ "$answer" = "exit" ]
    then
	exit=1
    else
	echo "I do not understand the command."
    fi
done

exit 0
