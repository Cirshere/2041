#!/bin/dash
cut -d'|' -f2,3 $1 | sort -u | awk '{print $2}' | sort | uniq -c | sort | tail -n 1 | awk '{print $2}'
