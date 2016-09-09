package Control::Model::Image;
use Mojo::Base 'MojoX::Model';
use Try::Tiny;
use Data::Dumper;

my ($r,$count,$rs,$exception, $id) = ('',0,0,'');

sub _init {
	my $model = shift;
	1;
}

sub set {
	my ($model, $data) = @_;
	return undef unless $data && %{$data};
	my $db = $model->app->db;
	
	try {
		my $r = $db->resultset('Image')->find({ md5_hex => $data->{'md5_hex'} });
		unless( $r ){
			my $res = $db->resultset('Image')->create( $data );
			return $res->image_id;
		}
		else{
			return $r->image_id;
		}
	}
	catch {
		my $err = $_;
		return undef, $err;
	};
}

sub set_product {
	my ($model, $data) = @_;	
	return undef unless $data && %{$data};
	my $db = $model->app->db;

	try {
		my $r = $db->resultset('Image2product')->find({ md5_hex => $data->{'md5_hex'}, path => $data->{'path'} });
		
		unless( $r ){
			
			my $res = $db->resultset('Image2product')->create( $data );
			if ( $res ) {
				return $res->image2product_id;
			}
		}
		else{
			return $r->image2product_id;
		}
	}
	catch {
		my $err = $_;
		$model->app->log->error( $err );
		return undef, $err;
	};
	
}

sub product_list{
	my ($model, $filter ) = @_;
	my $db = $model->app->db;
	
	$r = $db->resultset('Image2product')->search(
		$filter
	);
	
	$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res = $r->all();
  
	$rs = $db->resultset('Image2product')->search(
		$filter,
		{
			select => [
				{ count => 'image_id' }
			],
			as => [ 'count' ]
		}
	);
	
	my $del = $model->app->config->{'path'}->{'photo'};
	
	for my $item ( @res ){
		(my $url_path  = $item->{'path'} )=~s/$del//i;
		$item->{'url_path'} = "/simg".$url_path;
	}
	
	$count = $rs->next->get_column('count');  
	{ success => \1, count => $count, data => \@res };	
}

sub get_origin {
	my ($model, $filter ) = @_;
	my $db = $model->app->db;
	my $r = $db->resultset('Image')->find( $filter );
	my $h = {};
	my $del = $model->app->config->{'path'}->{'photo'};
	for my $key ( $r->columns ) {
		$h->{ $key } = $r->$key;
	}
	(my $url_path  = $h->{'path'} )=~s/$del//i;
	$h->{'url_path'} = "/simg".$url_path;
	return $h;
}

sub get_product_image {
	my ($model, $filter ) = @_;
	my $db = $model->app->db;
	my $r = $db->resultset('Image2product')->find( $filter );
	my $h = {};
	my $del = $model->app->config->{'path'}->{'photo'};
	for my $key ( $r->columns ) {
		$h->{ $key } = $r->$key;
	}
	(my $url_path  = $h->{'path'} )=~s/$del//i;
	$h->{'url_path'} = "/simg".$url_path;
	return $h;
}

sub get_all_photo {
	my ($model, $filter ) = @_;
	return undef unless $filter->{'product_id'};
	my $h = {};
	my $db = $model->app->db;
	my $r = $db->resultset('Image2product')->search( $filter, {
		group_by => [qw/image_id/],
		order_by => [qw/image_id/]
	} );
	$r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res = $r->all();
	
	return \@res;	
}
1;