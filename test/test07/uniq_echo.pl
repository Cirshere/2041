#!/usr/bin/perl -w

$string = '';
@arr = ();
foreach $arg (@ARGV) {
    if (grep(/^$arg$/, @arr)) {
        next;
    }
    
    $string = $string."$arg ";
    push(@arr, "$arg");

}

$string = substr($string, 0, -1);
print("$string\n");
