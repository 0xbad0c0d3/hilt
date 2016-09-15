use v5.18;
use warnings;
use open qw(:std :utf8);
use Mojo::Util qw(trim slurp);
use FindBin qw($Bin);
use utf8;
use Data::Dumper;

my $txt_1 = "Просто так	";
my $txt_2 = "	Просто так 2";

my $count = $txt_2 =~s/(\t+)/$1/ig;
say Dumper( $count );