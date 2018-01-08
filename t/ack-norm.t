#!perl -T

use strict;
use warnings;
use lib 't';

use Util;
use Test::More tests => 2;

prep_environment();

my @targets = map {
    "t/swamp/groceries/$_"
} qw/fruit junk meat/;
my @args    = ( qw( --nocolor café --ignore-case --norm ), @targets );
my @results = run_ack( @args );
my @expected = (
    't/swamp/groceries/junk:4:Café',
);

lists_match( \@results, \@expected, '--ignore-case --norm flag' );

@args    = ( qw( --nocolor Café --norm ), @targets );
@results = run_ack( @args );
@expected = (
    't/swamp/groceries/junk:4:Café',
);

lists_match( \@results, \@expected, '--norm flag' );
