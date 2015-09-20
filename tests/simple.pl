BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParse;

use Test::More tests => 1;

my $s = "show 1 2 title";

is SeriesInfo::NameParse::parse($s)->{show}  , "show"   , "get show from string";
