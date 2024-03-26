#!/bin/dash

if [ ! -d ".snapshot.$1" ]
then
    exit
fi

sh 'snapshot-save.sh'
echo "Restoring snapshot $1"

cp ".snapshot.$1/"* ./ -R
