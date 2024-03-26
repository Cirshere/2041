#!/bin/bash

while read lines
do
    echo $lines | tr '01234' '<' | tr '6789' '>'
done
