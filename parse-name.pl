#!/usr/bin/perl
use strict;
use warnings;
use SeriesInfo::NameParser;

if (scalar @ARGV != 1) {
    print STDERR "Expect <name> as argument\n";
    exit(1);
}

my $d = SeriesInfo::NameParser::parse($ARGV[0]);
if ($d) {
    print STDERR "match type: $d->{match}\n";
    print $d->{show}, "\n";
    print $d->{season}, "\n";
    my $numbers = $d->{numbers};
    if (scalar @$numbers > 1) {
        print "$_\n" foreach(@$numbers);
    } else {
        print $d->{number}, "\n";
    }
    print $d->{title}, "\n";
} else {
    print STDERR "Failed to parse '$ARGV[0]'\n";
    exit(2);
}
