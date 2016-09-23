use v5.18;
use warnings;
use open qw(:std :utf8);
use Mojo::Util qw(trim slurp);
use FindBin qw($Bin);
use utf8;
use Data::Dumper;

my $h = {};
$h->{ "	Просто так 2"} = 1234;

for my $key ( keys %{ $h }){
    $key = trim( $key );
    say Dumper( $key );
}

say Dumper ($h);
