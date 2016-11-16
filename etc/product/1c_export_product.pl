use v5.18;
use open qw(:std :utf8);
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use Schema;
use Data::Dumper;
use Mojo::JSON qw(encode_json);

my $conf = do "${Bin}/../../conf/hilt.conf";

my $db = Schema->connect(
			$conf->{'db'}->{'dbi'},
			$conf->{'db'}->{'user'},
			$conf->{'db'}->{'passwd'},
			{
				quote_names => 1,
				mysql_enable_utf8 => 1,
			}
		);



my $r = $db->resultset('VGetProduct1cExport')->search(undef);
	$r->result_class('DBIx::Class::ResultClass::HashRefInflator');

	my @res = $r->all();
	
	for my $item ( @res ) {
		my $data = map {
			{ uc($_) => $item->{$_} } 
		} keys %{ $item };
		
		(my $file = $item->{'date_update'})=~s/[^\d]//g;
		$file = $item->{'product_id'} . "_" . $file . ".json";
		
		open ( my $fh, '>:raw', $file );
		say $fh encode_json( $data );
		close( $fh );
		say $file . " => OK";
	}

