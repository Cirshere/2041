#!/usr/bin/perl -w

use File::Copy;

die if @ARGV != 1;

$i = 0;
while ( -e ".@ARGV.$i" ) {
    $i++;
}

print "Backup of '@ARGV' saved as '.@ARGV.$i'\n";
copy (@ARGV, ".@ARGV.$i");
