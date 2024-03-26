#!/bin/dash

if [ -d .girt ]
then
    rm -r .girt  
fi

sh girt-init

echo 'line 1' > a
echo 'line 2' > b
echo 'line 3' > c

sh girt-add a
sh girt-commit -m 'first - a'

sh girt-add b
sh girt-commit -m 'second - b'

sh girt-add c
sh girt-commit -m 'third - c'

sh girt-log

# Should fail
sh girt-commit -m 'fourth - nothing'

sh girt-log
