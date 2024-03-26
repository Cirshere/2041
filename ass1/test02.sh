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

# Should fail
sh girt-add d 

sh girt-commit -m 'first commit'

echo 'line 4' > a
if cmp a .girt/a > /dev/null 2>&1 
then
    echo "Test failed - Commit has not happened yet"
    exit
fi

sh girt-add a
sh girt-commit -m 'second commit'

# Should have same print
if ! cmp a .girt/a > /dev/null 2>&1 
then
    echo "Test failed - Commit failed"
    exit
fi

echo "Test successful"
