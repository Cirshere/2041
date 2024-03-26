#!/bin/dash

if ! [ -d .git ]
then
    echo "./final_q7.sh: Not a git repository"
    exit
fi

log=$(git log -v) > /dev/null 2>&1
date=$(echo $log | grep 'Date')
echo $date
