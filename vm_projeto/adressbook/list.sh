#!/bin/sh
# File: /zip/lessons/phone/list.sh
# Date: Mon Nov 18 18:14:31 EST 2002
# Last Revised: Time-stamp: <2002-11-18 18:14:37 john> maintained by emacs
# Description: List the entries in the address book with line numbers. 
# ======================================================================= 

BOOK="address-book.txt" 

# Display the format before the entries
echo "Line Number:   Name  ;  Phone Number"

# Print the book with line numbers and paused with less
nl --number-separator=":    " $BOOK | less 

