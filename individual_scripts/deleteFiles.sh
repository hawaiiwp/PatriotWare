#!/bin/bash

if [ $1 == -h ]
then
    ./functions/helpFunc.sh readmes/deleteFilesreadme.md
    exit 1
fi

echo '*____________________________________*'
echo '|                                    |'
echo '|                                    |'
echo '|                                    |'
echo '|      Have you come back after      |'
echo '|            editing the             |'
echo '|     data_files/foundFiles.txt      |' 
echo '|               file?                |'
echo '|                y/n                 |'
echo '|                                    |'
echo '*____________________________________*'

echo 

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo
	echo "Then let's skip the pleasantries"
	echo

	IFS=$'\n' read -d '' -r -a lines < data_files/foundFiles.txt

	for i in "${lines[@]}"
	do
		echo "Deleting file ${i}"
		rm "${i}"
	done

	exit 1
else
	echo
	echo 'Okay'
fi

echo '*____________________________________*'
echo '|                                    |'
echo '|                                    |'
echo '|                                    |'
echo '|    Ready to delete some files?     |'
echo '|                y/n                 |'
echo '|                                    |'
echo '*____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo
	echo 'Well alrighty then'
else
	echo 'Well alrighty then'
	exit 1
fi

echo 

echo 'Would you like to delete mp3 files? (y/n)'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo
	echo 'Searching for files'
        find / -iname '*.mp3' > data_files/foundFiles.txt
        echo 'Found files'
else
	echo 'Moving on'
fi

echo 

echo 'Would you like to delete mp4 files? (y/n)'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo
	echo 'Searching for files'
    find / -iname '*.mp4' >> data_files/foundFiles.txt
    echo 'Found files'
else
	echo 'Moving on'
fi

echo 

echo 'Would you like to delete common files such as passwords.txt, brutus, etc? (y/n)'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo
	echo 'Searching for files'
    find / -iname 'passwords.txt' >> data_files/foundFiles.txt
    find / -iname 'password.txt' >> data_files/foundFiles.txt
    echo 'Found files'
else
	echo 'Moving on'
fi

echo 

cat data_files/foundFiles.txt

echo

echo '*____________________________________*'
echo '|                                    |'
echo '|                                    |'
echo '|                                    |'
echo '|    Are you okay with deleting      |'     
echo '|           these files?             |'
echo '|                y/n                 |'
echo '|                                    |'
echo '*____________________________________*'

echo

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
	echo "Then let's get to deleting."
else
	echo 'Then go edit the data_files/foundFiles.txt file.'
	exit 1
fi

echo 

IFS=$'\n' read -d '' -r -a lines < data_files/foundFiles.txt

for i in "${lines[@]}"
do
	echo "Deleting file ${i}"
	rm "${i}"
done
