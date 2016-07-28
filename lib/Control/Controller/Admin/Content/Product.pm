package Control::Controller::Admin::Content::Product;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ($m) = ('');

sub _init {
	my $c = shift;
	$m = $c->model('product');
	1;
}

sub list {
	my $c = shift;
	return return $c->reply->not_found unless $c->_init();  
	
	$c->render( template => 'admin/content/product/list' );
}

sub item {
	my $c = shift;
	return return $c->reply->not_found unless $c->_init();  
	
	$c->render( template => 'admin/content/product/item' );	
}

sub set {
	my $c = shift;
	return return $c->reply->not_found unless $c->_init();
	
}
1;