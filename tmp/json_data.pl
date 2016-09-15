use Data::Dumper;
use Mojo::Base 'Mojolicious';
use Mojo::UserAgent;





    my $ua = Mojo::UserAgent->new;
    $ua->post('http://you.pp.ua/api/image/product/7' => form =>
        {
            files => { file => '/home/andrey/tmp/7.jpg'}
        });
    
my $h = $ua->res->to_string;

say Dumper( $h );    
  
__DATA__

{image => {file => '/home/sri/hello.png'}}

my $data = [
	{ parent_id => 1, url => 'clothing-and-shoes', title => 'Одежда и обувь' },
];

my $ua = Mojo::UserAgent->new( max_redirects => 10 );
my $r = $ua->post( 'http://127.0.0.1:3000/api/content/category/set' => json => $data );
#my $r = $ua->post( 'http://127.0.0.1:3000/api/user/remove' => json => $data );
#my $r = $ua->post( 'http://127.0.0.1:3000/api/user/update.json');

my $h = $r->res->to_string;

say Dumper( $h );
