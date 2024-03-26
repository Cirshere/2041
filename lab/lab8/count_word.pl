#!/usr/bin/perl -w

$count = 0;
while ($line = <STDIN>) {
    chomp $line;
    @words = split /[^a-zA-Z]/, $line;
    foreach $word (@words) {
        if (lc($word) eq "$ARGV[0]") {
            $count++;
        }
    }
}

print("$ARGV[0] occurred $count times\n");
