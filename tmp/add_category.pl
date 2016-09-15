use v5.18;
use warnings;
use open qw(:std :utf8);
use Mojo::Util qw(trim slurp);
use FindBin qw($Bin);
use lib "$Bin/../lib";
use Schema;
use utf8;
use Mojo::UserAgent;
use Data::Dumper;

my $file = "$Bin/../install/cat-for-site-trans.txt";
my $key = "";

my $ua = Mojo::UserAgent->new();

open my $fh, '<', $file;

my $tmp_id = 0;
my $tmp_count = 0;
my $parent_id = 1;
my $id = 1;
my $cid = 0;
my $i = 1;
my %level = ();

while( my $line = <$fh>) {
	chomp($line);
	my $count = $line =~s/(\t)/$1/g;
	$count = 0 unless $count;
	
	
	if( $count > $tmp_count ) {		
		$level{$count} = { 'parent_id' => $tmp_id };
	}
	
	$line = trim ( $line );
	my ($title,$url) = split (/=/, $line);
	
	next unless $title || $url;
	
	$level{$count}->{parent_id} ||= $parent_id;
		
		
	my $json = set( [{ title => $title, url => $url, parent_id => $level{$count}->{parent_id} } ]);
	
	if( ref $json eq 'HASH' && $json->{'success'} ) {
		$id = $json->{data}->[0]->{'category_id'};
	}
	else{
		say Dumper( $json );
		die 'error';
	}
	
	say "\t" x $count ." $count => id:$id => pid:$level{$count}->{parent_id} => $title => $url";
	
	$i++;
	$tmp_id = $id;
	$tmp_count = $count;
	#$level{'0'} = { parent_id => $ } unless $count;
	
	#if ($i>250){
	#	last;
	#}
}


say "End";


sub set {
	my $data = shift;
	$data->{'key'} = $key;
	my $r = $ua->post( 'http://127.0.0.1:3000/api/content/category/set' => json => $data );
	#say $r->res->to_string();
	
	if ( my $json = $r->res->json  ) {
		return $json;
	}
	return undef;
}
