#!/bin/dash

url="http://www.timetable.unsw.edu.au/current/"$1"KENS.html"

data="$(curl --location --silent $url)"
courses=$(printf "%s" "$data" | grep -Po ".*.html\">\K.*(?=<\/a)")

echo $courses | sed 's/[A-Z]\{4\}[0-9]\{4\}/\n&/g' | sed '1d' | sort -k2 | uniq | sort -n -k1
