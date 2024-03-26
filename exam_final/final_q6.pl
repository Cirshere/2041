#!/usr/bin/perl -w

while ($line = <STDIN>) {

    $line =~ /\|([A-Z].*[a-z]), (.*?)\|/;
    #print("$1 $2\n");
    $first = $2;
    $last = $1;
    $first =~ s/\s+$//;
    $last =~ s/\s+$//;;
    
    $line =~ s/$first/$last/g;
    $line =~ s/$last,/$first/g;
    print($line);    
    
}
