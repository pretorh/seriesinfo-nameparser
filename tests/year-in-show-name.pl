BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 1;

subtest "remove years from show name" => sub {
    plan tests => 1;
    is SeriesInfo::NameParser::parse("show 2015 1 2 title")->{show} , "show";
};
