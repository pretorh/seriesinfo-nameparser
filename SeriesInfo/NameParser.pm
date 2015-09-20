package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $_ = $s;
    return build($1, $2, $3, $4, "simple") if (m/(.+?) (\d?) (\d?) (.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\.S(\d\d?)E(\d\d?)\.(.+)$/);
    return;
}

sub build {
    my ($show, $season, $number, $title, $match) = @_;
    if ($show =~ /(.+)\W+\d\d\d\d/) {
        $show = $1;
    }
    return {
        show => $show,
        season => $season + 0,
        number => $number + 0,
        title => $title,
        match => $match,
    };
}

1;
