#!/usr/bin/perl -w

%data = ();
while ($input = <STDIN>) {
    $data{"$input"}++;
    if ($data{"$input"} == $ARGV[0]) {
        last;
    }
}

if (!defined($input)) {
    exit;
}
print("Snap: $input");
