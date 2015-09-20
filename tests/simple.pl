BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParse;

use Test::More tests => 2;

my $s = "show 1 2 title";
subtest $s => sub {
    plan tests => 4;
    is SeriesInfo::NameParse::parse($s)->{show}  , "show"   , "get show from string";
    is SeriesInfo::NameParse::parse($s)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParse::parse($s)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParse::parse($s)->{title} , "title"  , "get title from string";
};

is SeriesInfo::NameParse::parse(""), undef, "undefined returned for empty string";
