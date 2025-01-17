#!/usr/bin/perl -w

foreach $file (glob "lyrics/*.txt") {
    open FILE, "<", "$file" or die;
    
    $total = 0;
    $count = 0;
    
    while ($line = <FILE>) {
        chomp $line;
        @words = split /[^a-zA-Z]/, $line;
        foreach $word (@words) {
            if ($word eq "") {
                next;
            }
            if (lc($word) eq "$ARGV[0]") {
                $count++;
            }
            $total++;
        }
    }
    $filename = substr("$file", 7, -4);
    $filename =~ s/_/ /g;
    printf ("log((%d+1)/%6d) = %8.4f %s\n", $count, $total, log(($count + 1)/ $total), $filename);

    close FILE;
}



