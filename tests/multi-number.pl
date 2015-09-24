BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 1;

subtest "get multiple numbers" => sub {
    plan tests => 4;
    my @expect = (10, 11);
    is_deeply SeriesInfo::NameParser::parse("show 1 1011 title")->{numbers}, \@expect, "simple";
    is_deeply SeriesInfo::NameParser::parse("show S01E1011 title")->{numbers}, \@expect, "S__E____";
    is_deeply SeriesInfo::NameParser::parse("show S01E10&11 title")->{numbers}, \@expect, "S__E__&__";
    is_deeply SeriesInfo::NameParser::parse("show.01x1011.title")->{numbers}, \@expect, "__x____";
};
