package Control::Controller::Catalog;
use Mojo::Base 'Mojolicious::Controller';

sub _init {
  my $c = shift;
  my ( $m ) = ('');
  $m = $c->model('default');
  $m->get_default_data( $c );
}

sub default {
  my $c = shift;
  $c->portal;
}

sub item {
  my $c = shift;  
  $c->_init();
  
  my ( $m ) = ('');
  $m = $c->model('product');
  
  $c->stash->{ $c->config->{'project_name'} }->{'product_item'} =
	$m && $m->get_product_item
	  ? $m->get_product_item
	  : do {
		return $c->reply->not_found;
	  };
  
	$c->stash->{ $c->config->{'project_name'} }->{'filter'}->{'color'} = { title=>'Цвет', class => 'color-selector detail-info-entry', item_class => 'entry', items => [ { value => '#000000;'}, {value => '#333333;' } ] };
  $c->render(template => 'pages/catalog/item');
}

sub portal {
  my $c = shift;
  $c->_init();
  my $m = $c->model('product');
  
  $c->stash->{ $c->config->{'project_name'} }->{'products'} =
	$m && $m->get_products
	  ? $m->get_products
	  : do {
		return $c->reply->not_found;
	  };
  $c->stash->{ $c->config->{'project_name'} }->{'products_pagination'} = $c->pagination( $c->param('page') || 1, 100, { round => 1 });
	
	$c->stash->{ $c->config->{'project_name'} }->{'filter'}->{'color'} = { title=>'Цвет', class => 'color-selector detail-info-entry', item_class => 'entry', items => [ { value => '#000000;'}, {value => '#333333;' } ] };

  $c->render(template => 'pages/catalog');
}

1;