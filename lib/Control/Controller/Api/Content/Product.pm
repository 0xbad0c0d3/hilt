package Control::Controller::Api::Content::Product;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ($m,$db,$page,$rows,$id,$data, $init) = ('','', 1, 20, 0, '','');

sub _init {
	my $c = shift;
	$m = $c->model('Product');
	$init = $c->c_init();
	$data = $init->{'data'};
	1;
}

sub get {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();  
	return $c->reply->not_found unless $id;
	
	my $h = $m->get( $id );
	
	$c->render( json => $h );
}

sub update {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	
	unless ( $data  ) {
		return $c->render( json => { failue => \1, message => 'Нет данных' } );
	}
	
	if ( $data && ref $data ne 'ARRAY' ) {
		return $c->render( json => { failue => \1, message => 'Неправильная структура json' } );
	}
			
	my ( $h, $error ) = $m->update( $data ); 
	$c->render( json => $h ? { success => \1, data => $h } : { failue => \1, message => $error } );
}

sub set {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	if ( ref $data ne 'HASH') {
		$c->app->log->error('not valid param');
		return $c->render( json => { failue => \1, message => 'not valid param' } );
	}
	my @mandatory = qw(user_id supplier_id quantity unit_id url title description);
	my @entry = qw(depth width heigth weight tag_title tag_description tag_keywords);	
	my @keys_in = keys %{$data};
	my @all = ( @mandatory, @entry );
	my @error = ();
	my %data = ();
	
	for my $item ( @mandatory ){
		my $find = 0;
		for my $key ( @keys_in ){
			if( $item eq  $key ){
				$find = 1;
				last;
			}
		}
		unless( $find ){
			push @error, $item;
		}
	}
	
	if( @error ){
		$c->app->log->error('not all param: '. join( ",", @error ));
		return $c->render( json => {
			failue => \1,
			message => 'not all param: '. join( ",", @error )
		});
	}

	%data = map {
		if( $data->{$_} ){
			$_ => $data->{$_};
		}
		else{
			();
		}
	} @all;
	
	my ($res, $errstr ) = $m->set_product( \%data );
	
	if( $res && $res->{'product_id'} && @{ $data->{'files'} } ){
		my $r = $c->app->ua->post('/api/image/product/'. $res->{'product_id'} => form => {
			files => $data->{'files'},
			token => exists $data->{'token'} ? $data->{'token'} : ''
		});
	}

	$c->render( json => $res );
}

sub remove {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	my $data = $c->req->json;
	
	unless ( $data  ) {
		return $c->render( json => {
			failue => \1,
			message => 'Нет данных'
		} );
	}
	
	if ( $data && ref $data ne 'ARRAY' ) {
		return $c->render( json => {
			failue => \1,
			message => 'Неправильная структура json'
		} );
	}
	
	my ( $h, $error ) = $m->remove( $data );
	$c->render( json => $h ? { success => \1, data => $h } : { failue => \1, message => $error } );

}

sub list {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	$c->render( json => $m->list( $init->{'page'}, $init->{'rows'} ) );  
}
1;