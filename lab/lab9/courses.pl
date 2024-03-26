#!/usr/bin/perl -w

use LWP::Simple;

$url = "http://www.timetable.unsw.edu.au/current/".$ARGV[0]."KENS.html";
$page = get($url) or die "Unable to get $url";
%courses = ();
@strings = split('\n' , $page);

foreach $str (@strings) {
    if ($str =~ /\"([A-Z]{4}[0-9]{4}).html">\K(.*)(?=<\/a)/g) {
        $courses{"$1"} = "$2";
    }
}

@keys = sort(keys %courses);

foreach $key (@keys) {
    print("$key $courses{$key}\n");
}
