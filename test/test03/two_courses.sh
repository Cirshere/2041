#!/bin/dash
cut -d'|' -f2 $1 | sort | uniq -c | grep -E '2\s' | awk '{print $2}'
