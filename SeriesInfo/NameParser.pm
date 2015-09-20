package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $_ = $s;
    return build($1, $2, $3, $4, "simple") if (m/(.+?) (\d?) (\d?) (.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\WS(\d\d?)E(\d\d?)\W(.+)$/);
    return;
}

sub build {
    my ($show, $season, $number, $title, $match) = @_;
    my $year;
    if ($show =~ /(.+)\W+(\d\d\d\d)/) {
        $show = $1;
        $year = $2 + 0;
    }
    return {
        show => $show,
        year => $year,
        season => $season + 0,
        number => $number + 0,
        title => $title,
        match => $match,
    };
}

1;
