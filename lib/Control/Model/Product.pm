package Control::Model::Product;
use Mojo::Base 'MojoX::Model';
use Try::Tiny;
use Data::Dumper;

sub get_product2category {
	my $model = shift;
	my $data = shift;
	my $attr = shift;
	my $db = $model->app->db;
	
	my $r = $db->resultset('Product2category')->search( $data ,{
		rows => $attr->{'rows'},
		page => $attr->{'page'},
		group_by => ['product_id']
	});  

	$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res = $r->all();
  
	my $rs = $db->resultset('Product2category')->search(
		$data,
		{
			columns => [ qw/product_id/ ],
			distinct => 1
		}
	);
	  
	my $count = $rs->count;
	
	my @products = ();
	for my $item ( @res ){
		my $data = $model->get_v_product_info({ category_id => $item->{'category_id'}, product_id => $item->{'product_id'} });
		$item->{'data'} = $data if %{$data};
		push @products, $item->{'product_id'} if $data->{'quantity'};
	}
	
	$rs = $db->resultset('ProductPrice')->search({
		'product_id' => { IN => \@products },
	},{
		columns => [
			{ 'min' => { min => 'me.current'} },
			{ 'max' => { max => 'me.current'} }
		]
	});
	
	$rs->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res2 = $rs->all();
	
	{ success =>\1, count=> $count, page => $attr->{'page'}, rows => $attr->{'rows'},  data=>\@res,
		filter => {
			price => {
				min => $res2[0]->{'min'} ? int($res2[0]->{'min'}/100) : 0,
				max => $res2[0]->{'max'} ? int($res2[0]->{'max'}/100) : 0
			}
		}
	};	
	
}

sub get_product {
	my $model = shift;
	my $data = shift;
	my $db = $model->app->db;
	my $h = {};
	my $res = $db->resultset('Product')->find( $data );
	
	if( $res ){
		for my $key ( $res->columns ) {
			$h->{ $key } = $res->$key if defined $res->$key;
		}
		return $h;
	}
	return undef;
}

sub get_v_product_info {
	my $model = shift;
	my $data = shift;
	my $db = $model->app->db;
	my $h = {};
	my $res = $db->resultset('VProductInfo')->find( $data );	
	if( $res ){
		for my $key ( $res->columns ) {
			$h->{ $key } = $res->$key if defined $res->$key;
		}
		my $price = $model->get_product_price( { product_id => $h->{'product_id'} } );
		$h->{'price'} = $price;
		return $h;
	}	
	return undef;	
}

sub get_product_price {
	my $model = shift;
	my $data = shift;
	my $db = $model->app->db;
	my $h = {};
	my $res = $db->resultset('ProductPrice')->find( $data );
	if( $res ){
		for my $key ( $res->columns ) {
			$h->{ $key } = $res->$key if defined $res->$key;
		}
		$h->{'current'} = int($h->{'current'}/100) if $h->{'current'};
		$h->{'prev'} = int($h->{'prev'}/100) if $h->{'prev'};
		return $h;
	}
	return undef;
}

#
#  in \%data
#
sub set_product {
	my $model = shift;
	my $data = shift;
	my $db = $model->app->db;
	my $h = {};

	if( $h = $model->get_product( $data ) ){
		return $h;
	}
	
	$db->storage->txn_begin();
	try {
		my $res = $db->resultset('Product')->create( $data );
		
		for my $key ( $res->columns ) {
			$h->{ $key } = $res->$key if defined $res->$key;
		}
		
		$db->storage->txn_commit();
		return $h;
	}
	catch {
		my $err = $_;
		$db->storage->txn_rollback();
		return undef, $err;
	};  
}


1;