package Control::Controller::Api::Image::Product;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ( $files, $m, $db, $page, $rows, $id, $data, $init, $tmp_path_dir ) = ('', '', '', 0, 0, 0, [], {},'' );
my $q = 90;

sub _init {
	my $c = shift;
	$m = $c->model('image');
	$init = $c->c_init();
	$db = $c->db;
	$page = $init->{'page'};
	$rows = $init->{'rows'};
	$id = $init->{'id'};
	$data = $init->{'data'};
	$files = $c->req->every_upload('files');
	$tmp_path_dir = $c->app->config->{'image'}->{'tmp_path_dir'};
	$m && $db && $files ? 1 : 0;	
}

sub set {
	my $c = shift;
	say $c->_init;
	my ($file_tmp, $up_file, $path, $name, $w, $h ) = ('','','',0,0);
	#
	# Origin 
	#
	my $info = $c->app->config->{'image'}->{'product'}->{'origin'} or do {
		$c->app->log->warn('image->product->origin not exists');
		return $c->render('image->product->origin not exists');
	};
	
	
	unless( $id ){
		$c->app->log->warn('Not patam product_id');
		return $c->render( text => 'Not patam product_id' );
	}
	
	$path = exists $info->{'path'} ? $info->{'path'} : do {
		$c->app->log->warn('Error config image->product->origin not path to dir');
		return $c->render( text => 'Error config image->product->origin not path to dir' );
	};
	
	$w = $info->{'max_w'} if exists $info->{'max_w'};
	$h = $info->{'max_h'} if exists $info->{'max_h'};
	$q = exists $info->{'q'} ? $info->{'q'} : $q;
		
	for my $file ( @{$files} ){
		my $name = $file->filename =~ s/[^\w\d\.]+/_/gr;
		my $tmp_file = "$tmp_path_dir/$name";
		$file->move_to( $tmp_file );
		
		if( $w && $h ){
			say "img_resize";
			$up_file = $c->img_resize( $id, $tmp_file, $tmp_path_dir, $path, $name, $w, $h, $q );
		}
		elsif( $w || $h ){
			say "img_scale";
			$up_file = $c->img_scale( $id, $tmp_file, $tmp_path_dir, $path, $name, $w, $h, $q );
			
		}else{
			$c->app->log->warn('Error config image->product->origin not max_w or max_h');
			next;
		}		
	}
	$c->render( text => "UPLOAD" );
	
=item	
	#
	# Other size
	#
	for my $key ( grep{ $_ ne 'origin'} keys %{ $c->app->config->{'image'}->{'product'} } ) {
		my ($file_tmp, $path, $name, $w, $h, $q);
		my $data = $c->app->config->{'image'}->{'product'}->{'key'};
		$path = exists $data->{'path'} ? $data->{'path'} : do {
			$c->app->log->warn('Error config image->product->'.$key.' not path to dir');
			next;
		};
		$w = $data->{'max_w'} if exists $data->{'max_w'};
		$h = $data->{'max_h'} if exists $data->{'max_h'};
		$q = exists $data->{'q'} ? $data->{'q'} : $q;
		
		$c->img_resize( );
	}
=cut	
}

sub get {
	my $c = shift;
}

sub list {
	my $c = shift;
}

1;