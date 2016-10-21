package Control::Controller::Catalog;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ( $init, $m, %ids ) = ( '', '', () );

sub _init {
	my $c = shift;
	$m = $c->model('default');
	$m->get_default_data( $c );
	$init = $c->c_init();
	$c->_category();
	1;
}

sub default {
	my $c = shift;
	$c->portal;
}

sub item {
	my $c = shift;  
	$c->_init();
  
	my ( $m ) = ('');
	$m = $c->model('Product');
	(my $url = $c->stash('item'))=~s/(\.html|\.htm)//i;
	
	# Данные по продукту
	my $res = $m->get_v_product_info({
		category_id => $c->stash->{ $c->config->{'project_name'} }->{'category'}->{'category_id'},
		url => $url
	});
	
	# Картинки
	$m = $c->model('Image');
	my $img = $m->product_list( {
		product_id => $res->{'product_id'}
	} );
	$res->{'images'} = $img->{'data'};
	
	# Характреристики
	$m = $c->model('Feature');
	my $feature = $m->get_v_product2feature( $res->{'product_id'} );
	$res->{'feature'} = $feature;
	
	$c->stash->{ $c->config->{'project_name'} }->{'product_item'} =	$res;
	$c->render(template => 'pages/catalog/item');
}

sub portal {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	my @cat = @{ $c->stash->{ $c->config->{'project_name'} }->{'category_all'} };
	
	# Товары
	my $m = $c->model('Product');
	my $res  = $m->get_product2category(
		{
			'category_id' => { IN => \@cat },
		},
		$init
	);
	
	# Картинки
	$m = $c->model('Image');	
	for my $item ( @{$res->{'data'}} ){		
		my $img = $m->product_list( {product_id => $item->{'product_id'} } );
		$item->{'images'} = $img->{'data'};
	}	
	
	# Характеристики
	$m = $c->model('Feature');	
	for my $item ( @{$res->{'data'}} ){		
		my $feature = $m->get_v_product2feature( $item->{'product_id'} );
		$item->{'feature'} = $feature;
	}	
	
	my @arr = ( @{$res->{'data'}}, @{$res->{'data'}}, @{$res->{'data'}}, @{$res->{'data'}}, @{$res->{'data'}});
	$res->{'data'} = \@arr;
	
	$c->stash->{ $c->config->{'project_name'} }->{'products'} = $res;
	
	$c->stash->{ $c->config->{'project_name'} }->{'products_pagination'} = $c->pagination( $init->{'page'} || 1, $res->{'count'}, { round => 1 });	
	
	#
	# 
	#
	$m = $c->model('Filter');
	my $filter = $m->get_filter2catalog( { product => [ map{ $_->{'product_id'} } @{$res->{'data'}} ] } );
		
	$c->stash->{ $c->config->{'project_name'} }->{'filter'} = $filter;

	$c->stash->{ $c->config->{'project_name'} }->{'price'} = {
		min => $res->{'filter'}->{'price'}->{'min'},
		max => $res->{'filter'}->{'price'}->{'max'},
	};
		
	$c->render(template => 'pages/catalog');
}


sub _category {
	my $c = shift;
	return $c->reply->not_found unless $c->stash('path');
	my $arr = [{ url => '/', title => 'На главную' }];
	my $m = $c->model('Category');	
	my @urls = split /\//, $c->stash('path');
	my $u = shift @urls;
	
	my ($res, $error ) = $m->find({ url => $u, parent_id => 0});
	push @{ $arr }, {
		title => $res->[0]->{'title'},
		url => '/catalog/'.$res->[0]->{'url'},
		category_id => $res->[0]->{'category_id'},
		instr => $res->[0]->{'instr'}
	}
	if $res->[0]->{'url'};
	
	my $parent_id = $res->[0]->{'category_id'};
	
	for my $item ( @urls ) {
		my ($res, $error ) = $m->find({ url => $item, parent_id => $parent_id});
		$c->app->log->error('Not valid url: ' .$item. ' id:'.$parent_id ) unless %{ $res->[0] };
		push @{ $arr }, {
			title => $res->[0]->{'title'},
			url => $arr->[-1]->{'url'} . '/'. $res->[0]->{'url'},
			category_id => $res->[0]->{'category_id'},
			instr => $res->[0]->{'instr'},
		};
		$parent_id = $res->[0]->{'category_id'};	
	}
	$c->stash->{ $c->config->{'project_name'} }->{'breadcrumbs'} = $arr;
	$c->stash->{ $c->config->{'project_name'} }->{'category'} = $arr->[-1];
	$c->stash->{ $c->config->{'project_name'} }->{'category_all'} = $arr->[-1]->{'instr'} ? [ $arr->[-1]->{'instr'}=~/\d+/g ] : [];
	$arr;
}

1;