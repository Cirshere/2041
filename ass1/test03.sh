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
sh girt-commit -m 'first commit'

echo 'line 4' > a
sh girt-add a
sh girt-commit -m 'second commit'

echo "Show 0:a"
sh girt-show 0:a
echo "Show :a"
sh girt-show :a

echo 'line 5' > d
# Should fail
sh girt-show 0:d
sh girt-show :d

# Should succeed
sh girt-add d
sh girt-show :d
