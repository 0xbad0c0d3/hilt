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
				#push @{ $tmp_data }, ucfirst( decode('utf-8', trim($cell->{Val} || "") )  );
				push @{ $tmp_data }, ucfirst( decode('utf-8', trim($cell->{Val} || "") )  );
			}
		}
		#
		# Формируем данные
		#
		my $feature = {};
		if( $row ) {
			push @{ $data }, $tmp_data;
			for my $index ( keys %{$feature_index} ){
				$feature->{ $tmp_data->[$index] } = $tmp_data->[$index + 1] if $tmp_data->[$index];
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
			# Добавляем картинки
			#
			if( $tmp_hash->{'img'} ) {
				my @img = map{ "$Bin/" . trim($_) } split /[,]/, $tmp_hash->{'img'};
				$tmp_hash->{'files'} = \@img;
			}
			#
			# Парсим категории
			#
			if( $tmp_hash->{'category_id'} ) {
				$tmp_hash->{'category_id'} = [ split("[,\.]",$tmp_hash->{'category_id'}) ];
			}
			#*****************************
			#  Парсим характеристики
			#*****************************			
			if( $feature->{'Размер'} ){
				my @size =
					map{ uc( trim($_) ) }
						split(",",$feature->{'Размер'});
				
				my $quantity = 0;		
				my %size = map {
					my ($item_size,$count) = map{ trim($_) } split (":");
					$quantity += $count;
					if( $item_size && $count ){
						uc($item_size) => $count;
					}
					else{
						();
					}
				}
				@size;
				$tmp_hash->{'quantity'} = $quantity;
				$feature->{'Размер'} = \%size;
			}
			
			if( $feature->{'Материал'} ){
				my @data =
					map{ uc( trim($_) ) }
						split(",",$feature->{'Материал'});
						
				my %data = map {
					my ($item_name,$percent) = map{ trim($_) } split (":");
					if( $item_name && $percent ){
						ucfirst(lc($item_name)) => $percent;
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

my $index = 1;
for my $pr ( @{$db_data} ) {
	my $feature = $pr->{'feature'};
		delete $pr->{'feature'};
	my $data = $pr;
	$data->{'user_id'} = 1;
	
	
	print "Send product $index .. " . scalar @{$db_data};
	$index++;
	
	my ( $json,$err ) = add_product($data);
	if( $err ){
		say Dumper( 'error add_product => ' . $err );
		next;
	}
	else{
		print $json->{'success'};
		say " OK";
	}
	
	if( $pr->{'files'} && 1==1 ){
		print "Send img to product " . $json->{'product_id'} ." => ";
		my ($json,$err) = add_img( $json->{'product_id'}, $pr->{'files'} );
		if( $err ){
			say Dumper( 'error add_img => ', $err );
		}
		else{
			print $json->{'success'};
			say " OK";
		}
	}
	
	if( $feature && 1==1 ) {
		print "Send feature to product " . $json->{'product_id'} ." => ";
		my ($json,$err) = add_feature( $json->{'product_id'}, $feature );
		if( $err ){
			say Dumper( 'error add_feature => ', Dumper($err) );
		}
		else{
			print Dumper( $json );
			say " OK";
		}
	}
}


sub add_img {
	my $product_id = shift or do { return undef };
	my $files = shift or do { return undef };
	my $tx = $ua->post('http://127.0.0.1:3000/api/image/product/' . $product_id => form => {
		files => [ map {
			if( -f $_ ) {
				{ file => $_ };
			}
			else{
				();
			}
		}
		@{$files} ],
		token => $conf->{'api'}->{'token'}
	} );
	
	if(my $res = $tx->success ){
		return $res->json, undef;
	}
	else{
		return undef, $tx->error;
	}	
}

sub add_product {
	my $data = shift or do { return undef };
	$data->{'token'} = $conf->{'api'}->{'token'};

	my $tx = $ua->post('http://127.0.0.1:3000/api/content/product/set' => form => $data );
	if(my $res = $tx->success ){
		return $res->json, undef;
	}
	else{
		return undef, $tx->error;
	}
}

sub add_feature {
	my $product_id = shift or do { return undef };
	my $data = shift or do { return undef };
	$data->{'token'} = $conf->{'api'}->{'token'};
	
	my $tx = $ua->post('http://127.0.0.1:3000/api/content/feature2product/' . $product_id => json => $data );
	if(my $res = $tx->success ){
		return $res->json, undef;
	}
	else{
		return undef, $tx->error;
	}
	
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