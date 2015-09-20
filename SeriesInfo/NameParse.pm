package SeriesInfo::NameParse;

sub parse {
    my ($s) = @_;

    $s =~ /(.+?) (\d?) (\d?) (.+)$/;

    return {
        show => $1,
        season => $2,
        number => $3,
        title => $4,
    };
}

1;
