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

./functions/findFilesFunc.sh .mp3 data_files/foundFiles.txt first

echo 

./functions/findFilesFunc.sh .mp4 data_files/foundFiles.txt after

echo

./functions/findFilesFunc.sh .pdf data_files/foundFiles.txt after

echo 

./functions/findFilesFunc.sh password.txt data_files/foundFiles.txt after
./functions/findFilesFunc.sh passwords.txt data_files/foundFiles.txt after

echo 

args=($@)

for i in ${args[@]}
do
	./functions/findFilesFunc.sh $i data_files/foundFiles.txt after
	echo
done

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
