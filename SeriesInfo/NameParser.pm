package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $_ = $s;
    return build($1, $2, $3, $4, "simple") if (m/(.+?) (\d?) (\d?) (.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\WS(\d\d?)E(\d\d?)\W(.+)$/);
    return build($1, $2, $3, $4,  "__x__") if (m/(.+?)\D(\d\d?)x(\d\d?)\W(.+)$/);
    return;
}

sub build {
    my ($show, $season, $number, $title, $match) = @_;
    my $year;
    if ($show =~ /(.+)\W+(\d\d\d\d)/) {
        $show = $1;
        $year = $2 + 0;
    }
    $season += 0;
    $number += 0;
    my @numbers = ($number);

    return {
        show => $show,
        year => $year,
        season => $season,
        number => $number,
        numbers => \@numbers,
        title => $title,
        match => $match,
    };
}

1;
