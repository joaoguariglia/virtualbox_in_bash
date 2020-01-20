#!/bin/sh
# File: /zip/lessons/phone/add2.sh
# Date: Mon Nov 18 19:00:06 EST 2002
# Last Revised: Time-stamp: <2002-11-18 19:00:12 john> maintained by emacs
# Description: Add entries to the address book
# Revisied: Modifyed for the second version of phone book
# ======================================================================= 
# Name of address book
BOOK="address-book.txt"
# echo "Book = $BOOK"
echo -e "\n ======== Beginning Adding Addresses =======\n\n"

# Ask the user for a name and assign to a variable
echo -n "Name of person: " 
read name

# Ask for the street address
echo -n "Street Address: "
read street

# Ask for the city
echo -n "City: "
read city

# Ask for the state address
echo -n "State: "
read state

# Ask for the zip address
echo -n "Zip Code: "
read zip

# Ask the user for a phone number and assign to a variable
echo -n "Phone number: "
read phone

# Echo the answers and ask for confirmation
echo "Should I enter the values:"
echo -e " $name \n $street \n $city, $state, $zip \n $phone \n"
echo -n "y/n: "
read answer

# Convert the answer to lower case
fixedanswer=`echo $answer | tr "A-Z" "a-z"`;

if [ "$fixedanswer" = "y" ] 
then
    # Write the values to the address book
    echo "$name;$street;$city;$state;$zip;$phone" >>$BOOK
    echo "Added the entry OK"
    sleep 1
else
    # Give the user a message
    echo -e " $name \n $street \n $city, $state, $zip \n $phone \n NOT written to $BOOK"
    sleep 1
fi

exit 0
