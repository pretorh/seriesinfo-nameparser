package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $_ = $s;
    return build($1, $2, $3, $4, "simple") if (m/(.+?) (\d?) (\d?) (.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\.S(\d\d?)E(\d\d?)\.(.+)$/);
    return;
}

sub build {
    return {
        show => shift @_,
        season => (shift @_) + 0,
        number => (shift @_) + 0,
        title => shift @_,
        match => shift @_,
    };
}

1;
