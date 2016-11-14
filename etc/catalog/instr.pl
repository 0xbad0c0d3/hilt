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

my @instr = ();
my $hash = {};
sub _find {
    my $data = shift or do{ return undef };
    my $r = $db->resultset('Category2')->search($data);
	$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res = $r->all();
    
    my @id = ();
    for my $item ( @res ){
        
        my $r = $db->resultset('Category2')->search({ parent_id => $item->{'category_id'} });
        $r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
        my @res = $r->all();        
        if( @res ){
            push @id, _find( { parent_id => $item->{'category_id'} } );
        }
        
        push @id, $item->{'category_id'};
    }
    
    return @id;
}


my $r = $db->resultset('Category2')->search();
$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
my @res = $r->all();

for my $item ( @res ){    
    my $res = $db->resultset('Category2')->find( { category_id => $item->{'category_id'} } );
    if( $res ){
        try {
            my @parent = _find ( { parent_id => $item->{'category_id'} } );
            push @parent, $item->{'category_id'};
            my $txt = join(",", @parent);
            $res->instr($txt);
            $res->update();
            say Dumper( $item->{'category_id'} );
        }
        catch{
            say Dumper( $_ );  
        };
    }
}

