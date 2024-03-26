#!/usr/bin/perl -w

open FILE, '<', $ARGV[0] or die;
@lines = <FILE>;
close FILE;

open FILE, '>', $ARGV[0] or die;

foreach (@lines) {
    $_ =~ s/[0-9]/#/g;
    print FILE "$_";
}

close FILE;
