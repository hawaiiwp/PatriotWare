#!/bin/bash
if [ $1 == "-h" ]
then
    ./functions/helpFunc.sh readmes/ufwreadme.md
    exit 1
fi
echo "enabling ufw"
ufw enable
