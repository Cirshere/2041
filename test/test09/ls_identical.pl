#!/usr/bin/perl -w

use File::Compare;

$dir1 = $ARGV[0];
$dir2 = $ARGV[1];

opendir (DIR1, $ARGV[0]) or die;

@files = readdir(DIR1);
@output = ();
foreach $file (@files) {
    if (compare("$dir1/$file", "$dir2/$file") == 0) {        
        push(@output, $file);
    }

}

foreach $file (sort @output) {
    print("$file\n");
}
