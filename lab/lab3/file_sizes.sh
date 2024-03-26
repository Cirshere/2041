#!/bin/bash

SMALL="Small files:"
MED="Medium-sized files:"
LARGE="Large files:"

for file in *
do
len=$(wc -l $file | awk '{ print $1 }')
    
    if [ "$len" -lt 10 ]
    then
    
        SMALL="$SMALL $file"
    
    elif [ "$len" -lt 100 ]
    then
    
        MED="$MED $file"
    
    elif [ "$len" -ge 100 ]
    then
    
        LARGE="$LARGE $file"
        
    fi    
    
done

echo $SMALL
echo $MED
echo $LARGE
