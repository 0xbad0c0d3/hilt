use v5.16;
use Mojo::Asset::Memory;

my $mem = Mojo::Asset::Memory->new;
$mem->add_chunk('foo bar baz');
say $mem->slurp;
say $mem->size;