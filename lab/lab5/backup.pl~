#!/usr/bin/perl -w

die if @ARGV != 1;

$i = 0;
while ( -e ".@ARGV.$i" ) {
    $i++;
}

print "Backup of '@ARGV' saved as '.@ARGV.$i'\n";
use File::Copy;
copy (@ARGV, ".@ARGV.$i");
