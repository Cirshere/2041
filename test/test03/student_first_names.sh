#!/bin/dash
cut -d'|' -f2,3 $1 | sort -u | awk '{print $2}' | sort
