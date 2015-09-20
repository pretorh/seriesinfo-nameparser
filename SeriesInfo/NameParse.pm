package SeriesInfo::NameParse;

sub parse {
    my ($s) = @_;

    $s =~ /(.+?) (\d?) (\d?) (.+)$/;
    return build($1, $2, $3, $4) if ($1);
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
