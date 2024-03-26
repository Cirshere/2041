#!/usr/bin/perl -w

$count = 0;
@args = ();
foreach $arg (@ARGV) {
    
    $args[$count] = $arg;
    $count++;
}

@args = sort { $a <=> $b} @args;
printf("%d\n", $args[($count/2)]);
