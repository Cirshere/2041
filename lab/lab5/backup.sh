#!/bin/dash

if [ ! -f "$1" ]
then
    exit
fi

i="0"
while [ -f ".$1.$i" ]
do
    i=$(($i+1))
done

cat "$1" > ".$1.$i"
echo "Backup of '$1' saved as '.$1.$i'"

