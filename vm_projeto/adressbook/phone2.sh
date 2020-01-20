#!/bin/sh
# File: /zip/lessons/phone/phone2.sh
# Date: Mon Nov 18 18:59:08 EST 2002
# Last Revised: Time-stamp: <2002-11-18 18:59:15 john> maintained by emacs
# Description: Master script for phone book program
# Revised for the second version of the phone book.
# ======================================================================= 

# Name of address book
BOOK="address-book.txt"

export BOOK

exit=0

while [ $exit -ne 1 ]
do
    clear
    echo "What operation do you want?"
    echo -e "add, list, find, del, exit: "
    read answer

    if [ "$answer" = "add" ]
    then
	./add2.sh
    elif [ "$answer" = "list" ]
    then
	./list2.sh
    elif [ "$answer" = "find" ]
    then
	./find2.sh
    elif [ "$answer" = "del" ]
    then
	./del2.sh
    elif [ "$answer" = "exit" ]
    then
	exit=1
    else
        echo "I do not understand the command."
	sleep 5
    fi
done

exit 0
