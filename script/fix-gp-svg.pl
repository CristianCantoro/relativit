#!/usr/bin/perl
use warnings;
use strict;
while (<>) {
    s/(color:)(.*?)(;\s* stroke:)currentColor/$1$2$3$2/;
    print;
}

