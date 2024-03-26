#!/bin/dash

str1=$1
str2=$2

lower=$(echo $str1 | sed "s/[^0-9]*//g")
upper=$(echo $str2 | sed "s/[^0-9]*//g")

while [ $lower -le $upper ]
do
    echo "$str1" | sed "s/[0-9]\+/$lower/g"
    lower=$((lower + 1))
done
