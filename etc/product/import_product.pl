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

my ($cols,$data,$feature,$feature_index,$data_cols,$db_data) = ([],[],[],{},{},[]);
my $file = "${Bin}/products.xlsx";
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

#my %product_columns = map { $_ => 1  } $db->source('Product')->columns();
#my %feature_columns = map { $_ => 1  } $db->source('Feature')->columns();

my $excel = Spreadsheet::XLSX ->new( $file );
 
for my $sheet ( @{$excel->{Worksheet}} ) {

	printf("Sheet: %s\n", decode('utf-8',$sheet->{Name}) );
	$sheet -> {MaxRow} ||= $sheet -> {MinRow};

	for my $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
		$sheet -> {MaxCol} ||= $sheet -> {MinCol};
		
		my $tmp_data = [];
		for my $col ($sheet -> {MinCol} .. $sheet -> {MaxCol}) {
			my $cell = $sheet -> {Cells} [$row] [$col];
			if ( !$row ) {
				my $col_name = lc( trim($cell->{Val} || '') );
				push @{ $cols }, $col_name;
				$feature_index->{ $col } = 1 if $col_name eq 'f_name';
				$data_cols->{$col_name} = $col if $col_name !~ /f_name|f_value/i;
			}
			else{
				push @{ $tmp_data }, ucfirst( decode('utf-8', trim($cell->{Val} || "") )  );
			}
		}
		
		#
		# формируем характеристики
		#
		my $feature = {};
		if( $row ) {
			push @{ $data }, $tmp_data;
			for my $index ( keys %{$feature_index} ){
				$feature->{ $tmp_data->[$index] } = $tmp_data->[$index + 1];
			}
			#
			# формируем данные для заливки в базу
			#
			my $tmp_hash = {};
			for my $key ( keys %{$data_cols} ) {
				$tmp_hash->{ $key } = $tmp_data->[ $data_cols->{$key} ];
			}
			#
			# формируем url - транслитерация
			#
			unless ( $tmp_hash->{'url'} ) {
				my $tr = new Lingua::Translit("GOST 7.79 RUS");
				my $url = $tr->translit( $tmp_hash->{'title'} );
				$url =~s/[^0-9A-Z\s]//ig;
				$url =~s/\s+/-/ig;
				$tmp_hash->{'url'} = lc($url);
			}
			#
			# Парсим категории
			#
			if( $tmp_hash->{'category_id'} ) {
				$tmp_hash->{'category_id'} = [ split(",",$tmp_hash->{'category_id'}) ];
			}
			#*****************************
			#  Парсим характеристики
			#*****************************			
			if( exists $feature->{'Размер'} ){
				my @size =
					map{ uc( trim($_) ) }
						split(",",$feature->{'Размер'});
						
				my %size = map {
					my ($item_size,$count) = map{ trim($_) } split (":");
					if( $item_size && $count ){
						$item_size => $count;
					}
					else{
						();
					}
				}
				@size;
				$feature->{'Размер'} = \%size;
			}
			
			if( exists $feature->{'Материал'} ){
				my @data =
					map{ uc( trim($_) ) }
						split(",",$feature->{'Материал'});
						
				my %data = map {
					my ($item_name,$percent) = map{ trim($_) } split (":");
					if( $item_name && $percent ){
						$item_name => $percent;
					}
					else{
						();
					}
				}
				@data;
				
				$feature->{'Материал'} = \%data;
			}

			push @{$db_data}, $tmp_hash;

			$tmp_hash->{'feature'} = $feature;

		}
	}
	
}

say Dumper( $db_data );
for my $pr ( @{$db_data} ) {
	my $feature = $pr->{'feature'};
		delete $pr->{'feature'};
	my $data = $pr;
	undef $pr;
	#say Dumper( $data );
}


sub add_product {
	my $data = shift or do { return undef };
	my $res = $ua->post('/api/content/product/set' => form => $data );
}





__DATA__
	my $hash = {};
	for my $index ( 0 .. scalar @{$cols} ) {
		if( $cols->[$index] eq 'f_name'){
			say $data->[$index] ," => ", $data->[$index+1];
			$hash->{ $data->[$index] } = $data->[$index+1];
		}
	}
	push @{$feature}, $hash;
	
	say Dumper( $feature );

}