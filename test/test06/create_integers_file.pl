#!/usr/bin/perl -w

open (FILE, '>', "$ARGV[2]") or die;

$int = "$ARGV[0]";

while ($int <= "$ARGV[1]") {

    print FILE "$int\n";

    $int++;
}

close FILE;
