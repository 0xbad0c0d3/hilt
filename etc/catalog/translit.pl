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

my $conf = do "${Bin}/../../conf/hilt.conf";
my $data = {};
my $db = Schema->connect(
			$conf->{'db'}->{'dbi'},
			$conf->{'db'}->{'user'},
			$conf->{'db'}->{'passwd'},
			{
				quote_names => 1,
				mysql_enable_utf8 => 1,
			}
		);
# 
my @data = (
'Лепка',
'Пазлы',
'Модели для склеивания',
'Прочие наборы для творчества',
'Рукоделие'
);

for my $item ( @data ){
    $item = trim($item);
    say $item, ' => ' ,translit( $item );
    $data = {
        title => $item,
        url => translit( $item ),
        url2site => '/xobbi-i-tvorchestvo/'.translit( $item ),
        is_catalog => 1,
        parent_id => 685
    };
    my $res = $db->resultset('Category2')->create( $data );
    say Dumper( $res->category_id ) if $res;
}



sub translit {
    my $tr = new Lingua::Translit("GOST 7.79 RUS");
    my $txt = $tr->translit( shift );
    $txt =~s/[^0-9A-Z\s\/-]//ig;
    $txt =~s/\s+/-/ig;
    lc($txt);    
}
