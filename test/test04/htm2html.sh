#!/bin/dash

for file in *.htm
do

    if [ -f "${file}l" ]
    then
        
        echo "${file}l exists"
        exit 1
    
    fi
    
    mv "$file" "${file}l"

done
