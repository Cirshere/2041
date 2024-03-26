#!/bin/dash

if ! [ -d ./archive ]
then
    mkdir archive
fi

if [ -f ./log.6 ]
then
    date=$(date +'%Y_%m_%d')
    gzip log.6
    mv log.6.gz archive/log.$date.gz
fi

if [ -f ./log.5 ]
then
    mv log.5 log.6
fi

if [ -f ./log.4 ]
then
    mv log.4 log.5
fi

if [ -f ./log.3 ]
then
    mv log.3 log.4
fi

if [ -f ./log.2 ]
then
    mv log.2 log.3
fi

if [ -f ./log.1 ]
then
    mv log.1 log.2
fi

mv log log.1
