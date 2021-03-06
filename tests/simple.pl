BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 4;

my $s = "show 1 2 title";
subtest $s => sub {
    plan tests => 5;
    is SeriesInfo::NameParser::parse($s)->{show}  , "show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s)->{title} , "title"  , "get title from string";
    is SeriesInfo::NameParser::parse($s)->{year}  , undef    , "year is undefined";
};

is SeriesInfo::NameParser::parse(""), undef, "undefined returned for empty string";
isnt SeriesInfo::NameParser::parse($s)->{match} , undef , "get the match details in the result";
my @expect = (2);
is_deeply SeriesInfo::NameParser::parse($s)->{numbers}, \@expect,
    "get single episode number in array for single episode from string";
