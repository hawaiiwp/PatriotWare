#!/bin/bash

#this was made to shorten the individual_scripts/deleteFiles.sh script. 
#input 1 is the file extension, input 2 is the output file, and input 3 should be 'first' if it is the first search, and 'after' if it isn't.


echo "Would you like to delete $1 files? (y/n)"
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo
    echo 'Searching for files'
    find / -iname "*$1"
    echo 'Found files'
else
    echo 'Moving on'
fi
