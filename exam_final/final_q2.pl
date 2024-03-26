#!/usr/bin/perl -w

while ($line = <STDIN>) {

    if ($line =~ /3711\/.*/) {
        $count++;
    }

}

print("$count\n");
