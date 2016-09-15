use Data::Dumper;
use Mojo::Base 'Mojolicious';
use Mojo::UserAgent;


my $data = [
	{ title => 'Страна производитель', title_en => 'manufacturer country', 'overflow' => 1 },
];

my $ua = Mojo::UserAgent->new( max_redirects => 10 );
my $r = $ua->post( 'http://127.0.0.1:3000/api/content/feature' => json => $data );
#my $r = $ua->post( 'http://127.0.0.1:3000/api/user/remove' => json => $data );
#my $r = $ua->post( 'http://127.0.0.1:3000/api/user/update.json');

my $h = $r->res;

say Dumper( $h->json );
