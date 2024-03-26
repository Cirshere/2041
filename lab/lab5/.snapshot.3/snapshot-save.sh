#!/bin/dash

i=0
while [ -d ".snapshot.$i" ]
do
    i=$((i+1))
done

mkdir ".snapshot.$i"
echo "Creating snapshot $i"

for file in *
do
    if [ "$file" = "snapshot-save.sh" ] || [ "$file" = "snapshot-load.sh" ] || [ "$file" = "^.*" ]
    then
        continue
    fi
    
    
    cp "$file" ".snapshot.$i"
    
done

