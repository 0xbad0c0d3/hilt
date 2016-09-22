use v5.18;
use open qw(:std :utf8);
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use Data::Dumper;

use Spreadsheet::XLSX;
use Lingua::Translit;
use Schema;
use Encode qw(decode encode);
use Mojo::Util qw( trim );
use Mojo::UserAgent;
use Mojo::JSON qw(decode_json encode_json);

my ($cols,$tmp_data,$db_data) = ([],[],[],{},{},[]);
my $file = "${Bin}/banners.xlsx";
my $conf = do "${Bin}/../../conf/hilt.conf";
my $ua = Mojo::UserAgent->new;
my $db = Schema->connect(
			$conf->{'db'}->{'dbi'},
			$conf->{'db'}->{'user'},
			$conf->{'db'}->{'passwd'},
			{
				quote_names => 1,
				mysql_enable_utf8 => 1,
			}
		);

my $excel = Spreadsheet::XLSX ->new( $file );
 
for my $sheet ( @{$excel->{Worksheet}} ) {
	printf("Sheet: %s\n", decode('utf-8',$sheet->{Name}) );
	$sheet -> {MaxRow} ||= $sheet -> {MinRow};
	for my $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
		$sheet -> {MaxCol} ||= $sheet -> {MinCol};
		$tmp_data = [];	
		for my $col ($sheet -> {MinCol} .. $sheet -> {MaxCol}) {
			my $cell = $sheet -> {Cells} [$row] [$col];
			if ( !$row ) {
				$cols->[$#{$cols}+1] = lc( trim($cell->{Val} || '') );
			}
			else{
				$tmp_data->[$#{$tmp_data}+1] = ucfirst( decode('utf-8', trim(defined($cell->{Val}) ? $cell->{Val} : "") ) );
			}
		}

		if( @{$tmp_data} && ($db_data = { map { $cols->[$_] => $tmp_data->[$_] } (0 .. $#{$cols}) }) ) {
			if ( -f $db_data->{img} ){
				$db_data->{files} = {file => $db_data->{img} };
				delete($db_data->{img});
			}
			print Dumper($db_data);
			my $rx = $ua->post("http://127.0.0.1:3000/api/image/banner/$sheet->{Name}" => form => $db_data);
			my $json = decode_json($rx->res->content->asset->slurp);
			print Dumper($json);
		}
	}
}
