#!/usr/bin/perl -w

%lyrics = ();   
foreach $file (glob "lyrics/*.txt") {
    open FILE, "<", $file or die;
    
    $filename = substr("$file", 7, -4);
    $filename =~ s/_/ /g;
       
    while ($line = <FILE>) {
        chomp $line;
        @words = split /[^a-zA-Z]/, $line;
        foreach $word (@words) {
            if ($word eq "") {
                next;
            }
            
            $lyrics{$filename}{$word}++;

            $lyrics{$filename}{total}++;
        }
    }
    close FILE;      
}



foreach $file (glob "lyrics/*.txt") {
    open FILE, "<", $file or die;
    
    $filename = substr($file, 7, -4);
    $filename =~ s/_/ /g;
    
    print("$filename: $lyrics{$filename}{total}\n");
    close FILE;   
}
