# seriesinfo-nameparser
Perl module to parse string to get show name, season number, episode number

## Result

`parse(string)` returns a hash with the following keys:

- show
    - string. the name of the show
- season
    - int. the season number
- number
    - int. the episode number
- title
    - string. the episode title
- numbers
    - array. the episode numbers. use this when multiple numbers detected
- year
    - int/undef. year number if the show name included it
- match
    - string. name of the type of match used

## Type of matches

The following types of matches are catered for:

- `show 1 2 title`
- `show S01E02 title`
- `show 01x02 title`

All of these are for 'show', season 1, episode number 2, 'title'

## Tests

Tests files are located in the tests/ dir and use perl's `Test::More` module.  
They can be run using `./run-tests.sh`
