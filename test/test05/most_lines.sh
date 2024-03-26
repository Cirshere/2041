#!/bin/dash

wc -l "$@" | sed '$d' | sort -r | head -n 1 | awk '{ print $2 }'
