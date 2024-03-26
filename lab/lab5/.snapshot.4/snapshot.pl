#!/usr/bin/perl -w

use File::Copy;
use File::Basename;

sub save {
    #print "save\n";
    $i = 0;
    while ( -d ".snapshot.$i") {
        $i++;
    }
    
    print "Creating snapshot $i\n"; 
    mkdir ".snapshot.$i";
    
    @files = glob("*");
    foreach my $f (@files) {
        if ($f eq "snapshot.pl") {
            next;
        }
        
        copy ("$f", ".snapshot.$i/$f");
        #print "$f\n";
    }
    
}
       
sub load {
    #print "load\n"; 
    #if (! -d ".snapshot.$ARGV[1]") {
        #die;
    #}
    
    save();
    print "Restoring snapshot $ARGV[1]\n";
    
    @files = glob(".snapshot.$ARGV[1]/*");
    foreach my $f (@files) {
        
        $basename = basename("$f");   
        copy ("$f", "./$basename");
        
        #print "$f || $basename \n";
    }
    
}

if (@ARGV == 1 || @ARGV == 2) {
    
    if ($ARGV[0] eq 'save') {
        save();
    } elsif ($ARGV[0] eq 'load' && @ARGV == 2) {
        load();
    }
} else {
    die "Arguments are invalid";
}
    
