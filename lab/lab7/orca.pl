#!/usr/bin/perl -w

open FILE, "<", "$ARGV[0]" or die;

$count = 0;
while ($line = <FILE>) {
    
    # print("$line")
    
    chomp $line;    
    if ( (substr $line, 12, 4) eq 'Orca') {
        $count += int(substr $line, 9, 2);
    }

}

print ("$count Orcas reported in $ARGV[0]\n");

close FILE;
