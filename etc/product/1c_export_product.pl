use v5.18;
use open qw(:std :utf8);
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use Schema;
use Data::Dumper;

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
		say Dumper( $item );
	}

