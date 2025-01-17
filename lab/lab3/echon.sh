#!/bin/bash

if [ $# -ne 2 ]
then  
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit 1
    
elif ! echo "$1" | grep -E '^[0-9]+$' > /dev/null
then
    echo "./echon.sh: argument 1 must be a non-negative integer"
    exit 1

fi

num=1

while [ $num -le $1 ]
do
    echo $2
    num=$((num+1))
done
