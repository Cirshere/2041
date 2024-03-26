#!/bin/dash

for file in *.jpg
do 
    if [ -f "${file%.*}.png" ]
    then
        echo "${file%.*}.png already exists"
    fi
    gm convert "$file" "${file%.*}.png" > /dev/null 2>&1
done