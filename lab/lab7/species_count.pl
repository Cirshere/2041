#!/usr/bin/perl -w

open FILE, "<", "$ARGV[1]" or die;

$count = 0;
$pod = 0;
while ($line = <FILE>) {
    chomp $line;
    if ((substr $line, 12) eq "$ARGV[0]") {
        $count += int(substr $line, 9, 2);
        $pod++;
    }

}

print("$ARGV[0] observations: $pod pods, $count individuals\n");

close FILE;
