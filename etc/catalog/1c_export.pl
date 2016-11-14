use v5.18;
use open qw(:std :utf8);
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use Data::Dumper;

use Spreadsheet::XLSX;
use Excel::Writer::XLSX;
use Lingua::Translit;
use Schema;
use Encode qw(decode encode);
use Mojo::Util qw( trim );
use Mojo::UserAgent;

use Try::Tiny;

my ($cols,$data,$feature,$feature_index,$data_cols,$db_data,$data_h) = ([],[],[],{},{},[],{});
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

    
# Create a new workbook called simple.xls and add a worksheet
my $workbook  = Excel::Writer::XLSX->new( 'catalog.xlsx' );
my $worksheet = $workbook->add_worksheet();

my $r = $db->resultset('Category2')->search();
$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
my @res = $r->all();

$worksheet->write( 0, 0, "category_id" );
$worksheet->write( 0, 1, "parent_id" );
$worksheet->write( 0, 2, "name" );

my $count = 1;
for my $item ( @res ){
    $worksheet->write( $count, 0,$item->{'category_id'});
    $worksheet->write( $count, 1, $item->{'parent_id'} );
    $worksheet->write( $count, 2, $item->{'title'} );
    $count++;
}

say "OK";