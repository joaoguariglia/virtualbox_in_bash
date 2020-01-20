#!/bin/sh
# File: /zip/lessons/phone/find2.sh
# Date: Mon Nov 18 19:01:46 EST 2002
# Last Revised: Time-stamp: <2002-11-18 19:01:55 john> maintained by emacs
# Description: Find a specific line in the file.
# Revised for a more complex search capability
# ======================================================================= 
# Name of address book
BOOK="address-book.txt"
# Ask the user what to look for.
echo -n -e "What field would you like to search: \n\tname, street, city, state, zip, or phone: "
read field

echo -n "In the field = \"$field\", what string should I find? "
read string 

# Find the string in the selected field
case $field in  

    "name" ) # Search for a specific name
	     awk -v var=$string -F ";" '$1 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
             # result=`awk -F ";" '{printf "%d: %s\n", NR, $1}' $BOOK | grep -i $string | \
                     #awk -F ":" '{print $1}' `
	     ;;

    "street" ) # Search for a specific name
	       awk -v var=$string -F ";" '$2 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
              ;;

    "city" ) # Search for a specific name
	     awk -v var=$string -F ";" '$3 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
	     ;;

    "state" ) # Search for a specific name
	      awk -v var=$string -F ";" '$4 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
	     ;;

    "zip" ) # Search for a specific name
	    awk -v var=$string -F ";" '$5 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
	     ;;

    "phone" ) # Search for a specific name
	      awk -v var=$string -F ";" '$6 ~ var {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK | less
	     ;;

    "*" ) # Search pattern not recognized
	  echo "I did not understand your field name";
	  ;;
esac
 
# echo "Result = $result";

# if [ "$result" != "" ]
#     then
#     for number in $result
#     do 
#        awk -v val=$number  -F ";" 'NR == val {printf "Record: %d\n\t%s\n\t%s\n\t%s, %s, %s\n\t%s\n", NR, $1, $2, $3, $4, $5, $6}' $BOOK
#     done
# else
#     echo "Did not find $string in $field"
# fi

# echo "Past Case"
# sleep 5;

exit 0
