#!/bin/dash

for arg in "$@"
do

    list=$(cat $arg | grep -E "#include [^<]" | cut -d'"' -f2)
    
    for word in $list
    do
    
        if [ ! -f "$word" ]
        then
            echo "$word included into $arg does not exist"
        fi
    
    done

done
