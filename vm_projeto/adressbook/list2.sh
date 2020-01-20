#!/bin/sh
# File: /zip/lessons/phone/list2.sh
# Date: Mon Nov 18 19:00:59 EST 2002
# Last Revised: Time-stamp: <2002-11-18 19:01:05 john> maintained by emacs
# Description: List the entries in the address book with line numbers. 
# ======================================================================= 
# Name of address book
BOOK="address-book.txt"
# Read each line in the book and display

(awk -F ";" '{printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n==========================\n\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK ; echo "Press Q to Quit and return to the menu." ) | less

# Display the format before the entries
#echo "Line Number:   Name  ;  Phone Number"

# Print the book with line numbers and paused with less
#nl --number-separator=":    " $BOOK | less 
