#!/bin/dash

for arg in "$@"
do

    if [ ! -f $arg ]
    then
        echo "File does not exist"
        continue
    fi
    
    text=$(ls -l | grep -E "$arg" | cut -d' ' -f6-8)
    echo $text
    
    convert -gravity south -pointsize 40 -draw "text 0,0 '$text'" $arg $arg

done
