#!/bin/sh
# File: /zip/lessons/phone/del2.sh
# Date: Mon Nov 18 19:02:44 EST 2002
# Last Revised: Time-stamp: <2002-11-18 19:15:21 john> maintained by emacs
# Description: Delete the line specified by the user.
# ======================================================================= 
# Name of address book
BOOK="address-book.txt"

# Ask the user which line to delete
echo -n "Which record should I delete: "
read number

# Display the record selected
awk -v var=$number -F ";" 'NR ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK

# Ask the user if this is correct before deleting.
echo -n "Is this the correct record to delete? (y/n): "
read answer

# Lower case the answer and check
fixedanswer=`echo $answer | tr "A-Z" "a-z"`;
if [ "$fixedanswer" = "y" ] 
then

    # Rename the file before deleting
    mv $BOOK boo.txt

    # Add line numbers and delete against that number
    nl --number-format=rz --number-separator=":" boo.txt | grep -v 0$number: | awk -F: '{print $2}' |  tee $BOOK

else

    echo "Did not delete the record"
    sleep 5

fi
