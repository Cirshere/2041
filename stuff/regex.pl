#!/usr/bin/perl -w

$line = 12;
$address = "qr/[2468]/";
$command = "d";

chomp $line;
if ("$line" =~ $address) {

    if ($command eq 'd') {
        print("deleted\n");
    }
    
}
