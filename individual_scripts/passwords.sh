#!/bin/bash

if [ $1 == -h ]
then
    ./functions/helpFunc.sh readmes/passwordsreadme.md
    exit 1
fi

echo "It is recomended that you run the EXTERMINATE script before this, with this in mind, would you like to continue? (y/n)"

    read -p 'y/n: ' RESP
    if [ $RESP == 'y' ]
    then
        echo
        echo 'Nice'
        echo 
    else
        echo 
        echo 'Bye :('
        exit 1
    fi

# Updating the users.txt file

sed -i '/^$/d' data_files/users.txt
sed -i '/^$/d' data_files/users2.txt

for i in {1000..2000}
do 
    if [ ${i} == 1000 ]
    then
        grep -n $i /etc/passwd > data_files/users.txt
    else
        grep -n $i /etc/passwd >> data_files/users.txt
    fi
done

sed -i '/^$/d' data_files/users.txt
sed -i '/^$/d' data_files/users2.txt

awk -F: '{ print $2}' data_files/users.txt > data_files/users2.txt
cat data_files/users2.txt > data_files/users.txt

sed -i '/^$/d' data_files/users.txt
sed -i '/^$/d' data_files/users2.txt

IFS=$'\n' read -d '' -r -a users < data_files/users.txt

if [ $# == 1 ]   
then
    for i in ${users[@]}
    do
        echo -e "$1\n$1" | passwd ${i} &> /dev/null
        if [ $? != 0 ]
        then
            echo -e "Something went wrong when trying to change the password for ${i}"
        else
            echo -e "Successfully changed the password for ${i}"
        fi
    done
elif [ $# == 0 ]
then
    echo "Not enough arguments!"
else 
    echo 'Too many arguments!'
fi
