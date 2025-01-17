#!/usr/bin/perl -w

# Error checking for arguments
if (@ARGV == 0) {
    print("usage: speed [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n");
    exit;
} elsif ($ARGV[0] ne "-n" && @ARGV > 1) {
    print("speed: error\n");
    exit;
} elsif ($ARGV[0] eq "-n" && @ARGV > 2) {
    print("speed: error\n");
    exit;
}

# Extracting commands
if ($ARGV[0] eq "-n") {
    $cmd = $ARGV[1];
} else {
    $cmd = $ARGV[0];
}
$cmd =~ /(\/.*?\/|[0-9]*)(.*)/g;
#print("$1 $2\n");

$command = "$2";
$address = "$1";

#print("$command\n");
#print("$address\n");
if ("$command" ne "p" && "$command" ne "d" && !("$command" =~ /^s\/.*\/.*\/[g|]$/)&& "$command" ne "s" && !("$command" =~ /^q[0-9]*$/)) {
    print("speed: command line: invalid command\n");
    exit;
}

if ("$command" =~ /^s\/(.*)\/(.*)\/$/) {
    $old = $1;
    $new = $2;
    #print("$1 $2\n");
}

$address =~ s/\///g;
#$regex = "rq/$address/";

$count = 1;
while ($line = <STDIN>) {
    chomp $line;  
    
    #print("$line $address\n");
    $address =~ s/\///g;
    #$address = "qr/$address/";
    #if ("$line" =~ $address) {
        #("regex works\n");
    #}
    
    if ("$count" eq "$address" || "$line" =~ $address) {
        
        if ($command eq 'p') {
            print("$line\n");
        } elsif ($command eq 'd') {
            $count++;
            next;
        } elsif ("$command" =~ /^q[0-9]$/) {
            print("$line\n");
            exit;
        }
    } elsif ("$command" =~ /^s\/.*\/.*\/$/) {
        $line =~ s/$old/$new/;
        print("$line\n");
    } elsif ("$command" =~ /^s\/.*\/.*\/$/g) {
        $line =~ s/$old/$new/g;
        print("$line\n");
    }
    
    if ($ARGV[0] ne "-n") {
        print("$line\n");
    }
    
    if ("$address" eq '' && "$command" =~ /^q[0-9]$/) {
        exit;
    }
    
    $count++;
}
