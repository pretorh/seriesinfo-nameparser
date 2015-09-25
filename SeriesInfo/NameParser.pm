package SeriesInfo::NameParser;

sub parse {
    my ($s) = @_;

    $_ = $s;
    return build($1, $2, $3, $4, "simple") if (m/(.+?) (\d?) (\d+) (.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\WS(\d\d?)E(\d\d\&\d\d)\W(.+)$/);
    return build($1, $2, $3, $4, "SxxExx") if (m/(.+?)\WS(\d\d?)E(\d\d+)\W(.+)$/);
    return build($1, $2, $3, $4,  "__x__") if (m/(.+?)\D(\d\d?)x(\d\d+)\W?(.*)$/);
    return;
}

sub build {
    my ($show, $season, $number, $title, $match) = @_;
    my $year;
    ($show, $year, $number) = cleanUpValues($show, $number);
    my @numbers;
    ($season, $number, @numbers) = getSeasonAndNumbers($season, $number);

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

sub cleanUpValues {
    my ($show, $number) = @_;
    my $year;
    if ($show =~ /(.+)\W+(\d\d\d\d)/) {
        $show = $1;
        $year = $2 + 0;
    }
    $number =~ s/&// if ($number =~ /&/);
    return ($show, $year, $number);
}

sub getSeasonAndNumbers {
    my ($season, $number) = @_;
    $season += 0;
    $number += 0;
    my @numbers = ($number);
    if ($number > 99) {
        @numbers = (int($number / 100), $number % 100);
    }
    return ($season, $number, @numbers);
}

1;
