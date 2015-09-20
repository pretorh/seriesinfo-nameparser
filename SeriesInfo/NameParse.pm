package SeriesInfo::NameParse;

sub parse {
    my ($s) = @_;

    $s =~ /(.+?) /;

    return {
        show => $1,
    };
}

1;
