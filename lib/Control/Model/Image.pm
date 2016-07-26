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
	my ($model, $db, $data) = @_;
	return undef unless $data && %{$data};
	
	#$db->storage->txn_begin();
	try {
		my $r = $db->resultset('Image')->find({ md5_hex => $data->{'md5_hex'} });
		unless( $r ){
			my $res = $db->resultset('Image')->create( $data );
			#$db->storage->txn_commit();
			return $res->image_id;
		}
		else{
			return $r->image_id;
		}
	}
	catch {
		my $err = $_;
		#$db->storage->txn_rollback();
		return undef, $err;
	};
}

sub set_product {
	my ($model, $c, $db, $data) = @_;
	return undef unless $data && %{$data};

	#$db->storage->txn_begin();
	try {
		my $r = $db->resultset('Image2product')->find({ md5_hex => $data->{'md5_hex'}, path => $data->{'path'} });
		
		unless( $r ){
			
			my $res = $db->resultset('Image2product')->create( $data );
			say Dumper('model', $data, $res->image2product_id);
			if ( $res ) {
				#$db->storage->txn_commit();
				return $res->image2product_id;
			}
		}
		else{
			return $r->image2product_id;
		}
	}
	catch {
		my $err = $_;
		$c->app->log->error( $err );
		#$db->storage->txn_rollback();
		return undef, $err;
	};
	
}

1;