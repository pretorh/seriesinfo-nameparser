BEGIN {@INC=("../",@INC)};
use strict;
use warnings;
use SeriesInfo::NameParser;

use Test::More tests => 3;

my $s1 = "Show.S01E02.title";
subtest $s1 => sub {
    plan tests => 5;
    isnt SeriesInfo::NameParser::parse($s1)        , undef    , "not undefined";
    is SeriesInfo::NameParser::parse($s1)->{show}  , "Show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s1)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s1)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s1)->{title} , "title"  , "get title from string";
};

my $s2 = "Show S01E02 title";
subtest "with spaces ($s2)" => sub {
    plan tests => 5;
    isnt SeriesInfo::NameParser::parse($s2)        , undef    , "not undefined";
    is SeriesInfo::NameParser::parse($s2)->{show}  , "Show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s2)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s2)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s2)->{title} , "title"  , "get title from string";
};

my $s3 = "Show.s01e02.title";
subtest "case insensitive ($s3)" => sub {
    plan tests => 5;
    isnt SeriesInfo::NameParser::parse($s3)        , undef    , "not undefined";
    is SeriesInfo::NameParser::parse($s3)->{show}  , "Show"   , "get show from string";
    is SeriesInfo::NameParser::parse($s3)->{season}, 1        , "get season number from string";
    is SeriesInfo::NameParser::parse($s3)->{number}, 2        , "get episode number from string";
    is SeriesInfo::NameParser::parse($s3)->{title} , "title"  , "get title from string";
};
