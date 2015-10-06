BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 1;

my $s = "show Season 01 Episode 02 title";
subtest $s => sub {
    plan tests => 5;
    is SeriesInfo::NameParser::parse($s)->{show}  , "show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s)->{title} , "title"  , "get title from string";
    is SeriesInfo::NameParser::parse($s)->{year}  , undef    , "year is undefined";
};
