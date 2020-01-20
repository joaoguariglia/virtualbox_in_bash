#!/bin/sh
# File: /zip/lessons/phone/find.sh
# Date: Mon Nov 18 18:51:29 EST 2002
# Last Revised: Time-stamp: <2002-11-18 18:51:37 john> maintained by emacs
# Description: Find a specific line in the file.
# ======================================================================= 

BOOK="address-book.txt"

# Ask the user what to look for.
echo -n "What person or number are you seeking: "
read find

# Print the header before the answer
echo "Name ; Phone number"
grep -i $find $BOOK

