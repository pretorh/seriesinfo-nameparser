BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParse;

use Test::More tests => 4;

my $s = "show 1 2 title";

is SeriesInfo::NameParse::parse($s)->{show}  , "show"   , "get show from string";
is SeriesInfo::NameParse::parse($s)->{season}, 1        , "get season number from string";
is SeriesInfo::NameParse::parse($s)->{number}, 2        , "get episode number from string";
is SeriesInfo::NameParse::parse($s)->{title} , "title"  , "get title from string";
