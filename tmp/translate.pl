use Data::Dumper;
use Mojo::Base 'Mojolicious';
use Mojo::UserAgent;
use FindBin qw($Bin);
use open qw(:std :utf8);
use Mojo::Util qw(trim);

my $file_in = "$Bin/../install/cat-for-site.txt";
my $file_out = "$Bin/../install/cat-for-site-trans.txt";

my $key = 'trnsl.1.1.20160530T104429Z.58520604b4ad847f.aaa5e522a209555ced03b609207594456a441267';

open (my $file_1,'<', $file_in );
open (my $file_2,'>', $file_out );
# / => b
my $i = 0 ;
while( my $str = <$file_1> ){
	(my $tmp = $str)=~s/\//and/g;
	my $data = {
		key => $key,
		text => $str,
		lang => 'en',
		format => 'plain',
	};
	
	my $ua = Mojo::UserAgent->new( max_redirects => 10 );
	my $r = $ua->get( 'https://translate.yandex.net/api/v1.5/tr.json/translate' => form => $data );
	
	if ( my $json = $r->res->json  ) {
		if ( $json->{code} == 200 ){		
			my $url = lc( $json->{text}[0] ) ;
			chomp(  $str );
			$url = trim($url);
			$url =~s/\s+/-/g;
			$url =~s/,//g;
			$url =~s/\-+/\-/g;
			$url =~s/-\/-/-/g;
			$str =~s/(\t+)$//;
			say $url;
			say $file_2 "$str=$url";
		}
	}
	#if( $i > 10){
	#	last;
	#}
	$i++;
}

close( $file_1 );
close( $file_2 );