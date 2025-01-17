#!/usr/bin/perl -w

%words = ();
$count = 0;
$max = "$ARGV[0]";

while ($line = <STDIN>) {
    $line = lc($line);
    $line =~ s/ //g;
    $words{"$line"}++;
    $count++;
    
    if (keys %words == $max) {
        last;
    }
}

if (keys %words == $max) {
    print("$max distinct lines seen after $count lines read.\n");
} else {
    print("End of input reached after $count lines read - $max different lines not seen.\n");
}
