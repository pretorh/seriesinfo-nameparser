BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 1;

subtest "get multiple numbers" => sub {
    plan tests => 2;
    my @expect = (10, 11);
    isnt SeriesInfo::NameParser::parse("show S01E1011 title")                , undef, "not undefined";
    is_deeply SeriesInfo::NameParser::parse("show S01E1011 title")->{numbers}, \@expect, "S__E____";
};
