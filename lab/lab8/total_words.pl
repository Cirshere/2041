#!/usr/bin/perl -w

$count = 0;
while ($line = <STDIN>) {
    chomp $line;
    @words = split /[^a-zA-Z]/, $line;
    foreach $word (@words) {
        if ($word eq '') {
            next;
        }
        $count++;
    }
}

print("$count words\n");