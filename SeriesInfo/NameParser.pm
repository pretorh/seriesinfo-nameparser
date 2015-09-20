package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $s =~ /(.+?) (\d?) (\d?) (.+)$/;
    return build($1, $2, $3, $4) if ($3);
}

sub build {
    return {
        show => shift @_,
        season => shift @_,
        number => shift @_,
        title => shift @_,
    };
}

1;
