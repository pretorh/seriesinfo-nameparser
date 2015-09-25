BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 1;

my $s1 = "show.01x02";
subtest "title is optional ($s1)" => sub {
    plan tests => 5;
    isnt SeriesInfo::NameParser::parse($s1)        , undef    , "not undefined";
    is SeriesInfo::NameParser::parse($s1)->{show}  , "show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s1)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s1)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s1)->{title} , ""       , "title is undefined";
};
