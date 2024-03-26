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
sh girt-add b

if [ ! -f .girt/index/a ] && [ ! -f .girt/index/b ]
then
    echo "Test failed - 'a' and 'b' not in index"
    exit
fi

sh girt-commit -m 'first commit'

if [ ! -f .girt/a ] && [ ! -f .girt/b ]
then
    echo "Test failed - 'a' and 'b' not added to repo"
    exit
fi

if [ -f .girt/c ]
then
    echo "Test failed - 'c' was added"
    exit
fi

echo "Test successful"

