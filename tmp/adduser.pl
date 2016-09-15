use v5.12;
use Data::Dumper;
use FindBin qw( $Bin );
use lib "$Bin/../lib";
use Schema;


my $db = Schema->connect(
			'dbi:mysql:dbname=hilt',
			'root',
			'',
			{
				quote_names => 1,
				mysql_enable_utf8 => 1,
			}
);


my $r = $db->resultset('Category')->search(
			{
				parent_id => 1,
				title => 'Одежда и обувь',
				url => 'clothing-and-shoes'
				
			}, {});


my $cd =  $r->next;

#my $id = $r->next->category_id;

say Dumper( $cd->category_id );

#	{ parent_id => 1, url => 'clothing-and-shoes', title => 'Одежда и обувь' },
