#!/bin/dash

if [ -d .girt ]
then
    rm -r .girt  
fi

sh girt-init

echo 'line 1' > a
echo 'line 2' > b
echo 'line 3' > c

sh girt-add a b c
sh girt-commit -m 'first'

echo 'line 4' > a
echo 'line 5' > b

sh girt-show :a
sh girt-show :b

sh girt-commit -a -m 'second'

echo "Show of commit 0"
sh girt-show 0:a
sh girt-show 0:b

echo "Show of index"
sh girt-show :a
sh girt-show :b
