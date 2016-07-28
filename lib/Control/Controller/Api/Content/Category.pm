package Control::Controller::Api::Content::Category;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ($m,$db,$page,$rows,$id) = ('','', 1, 20, 0);

sub _init {
	my $c = shift;
	$m = $c->model('category');
	$db = $c->db;
	$page = $c->param('page') ? $c->param('page') : $page;
	$rows = $c->param('rows') ? $c->param('rows') : $rows;
	$id = defined $c->param('id') ? $c->param('id') : 0;
	1;
}

sub get {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();  
	return $c->reply->not_found unless $id;
	
	my $h = $m->get( $db, $id );	
	$c->render( json => $h );
}

sub update {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	my $data = $c->req->json;
	
	unless ( $data  ) {
		return $c->render( json => { failue => \1, message => 'Нет данных' } );
	}
	
	if ( $data && ref $data ne 'ARRAY' ) {
		return $c->render( json => { failue => \1, message => 'Неправильная структура json' } );
	}
			
	my ( $h, $error ) = $m->update( $db, $data );  
	$c->render( json => $h ? { success => \1, data => $h } : { failue => \1, message => $error } );
	
}

sub set {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	my $data = $c->req->json;
	my $res = [];
	
	unless ( $data  ) {
		return $c->render( json => { failue => \1, message => 'Нет данных' } );
	}
	
	if ( $data && ref $data ne 'ARRAY' ) {
		return $c->render( json => { failue => \1, message => 'Неправильная структура json' } );
	}
	  
	my ( $h, $error ) = $m->set( $c, $db, $data );
	
	$c->render( json => $h ? { success => \1, data => $h } : { failue => \1, message => $error } );  
}

sub remove {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	my $data = $c->req->json;
	
	unless ( $data  ) {
		return $c->render( json => { failue => \1, message => 'Нет данных' } );
	}
	
	if ( $data && ref $data ne 'ARRAY' ) {
		return $c->render( json => { failue => \1, message => 'Неправильная структура json' } );
	}
	
	my ( $h, $error ) = $m->remove( $db, $data );
	$c->render( json => $h ? { success => \1, data => $h } : { failue => \1, message => $error } );
  
}

sub list {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	
	$c->render( json => $m->list( $db, $page, $rows ) );  
}

my $dom = '';
sub megamenu {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();

	#$dom = Mojo::DOM->new('<div id="megamenu" class="information-blocks categories-border-wrapper"></div>');
	$dom = Mojo::DOM->new('<div id="megamenu2" class="information-blocks categories-border-wrapper col-md-3 col-sm-6 col-xs-11">');	

	#$dom->at('div#megamenu')->append_content('
	#	<div class="block-title size-3">Каталог товаров</div>
	#	<div class="accordeon_1"></div>
	#');

	$dom->at('div#megamenu2')->append_content('
		<div class="accordeon_1"></div>
	');


	$c->_megamenu( { parent_id => 1 }, 0, '/catalog' );

	open (my $fh, '>', $c->config->{'template'}->{'path'}.'/pages/default/blocks/megamenu4.html.tt');	
	say $fh $dom;	
	close ($fh);
	say "OK";
	
	$c->render( text => 'OK' );
}

sub _megamenu {
	my $c = shift;
	my $filter = shift;
	my $level = shift;
	my $url_site = shift;
	my $data = $m->find( $db, $filter );

	say "\t" x $level . $filter->{'parent_id'};
	
	if( @{ $data } ){
		for my $item ( @{ $data } ){
			my $data_child = $m->find( $db, { parent_id => $item->{'category_id'} } );
			my $url = $url_site."/".$item->{'url'};
			
			if( scalar @{$data_child} ){				
				if( $level && $dom->at('div.accordeon_'.$filter->{'parent_id'}) ){
					$dom->at('div.accordeon_'.$filter->{'parent_id'})->append_content('<div class="accordeon-title child"><a href="'.$url.'">'.$item->{'title'}.'</a></div>');
				}
				elsif( $dom->at('div.accordeon_'.$filter->{'parent_id'}) ) {
					$dom->at('div.accordeon_'.$filter->{'parent_id'})->append_content('<div class="accordeon-title"><a href="'.$url.'">'.$item->{'title'}.'</a></div>');
				}
				elsif( $dom->at('ul.list_'.$filter->{'parent_id'}) ){
					$dom->at('ul.list_'.$filter->{'parent_id'})->append_content('
					<li class="child">
						<div class="accordeon_'.$filter->{'parent_id'}.'">
							<div class="accordeon-title"><a href="'.$url.'">'.$item->{'title'}.'</a></div>
						</div>
					</li>');
				}
				
				$dom->at('div.accordeon_'.$filter->{'parent_id'})->append_content('
					<div class="accordeon-entry cat_'.$filter->{'parent_id'}.'">
						<div class="article-container style-1">
							<ul>
								<li class="child">
									<div class="accordeon_'.$item->{'category_id'}.'">
									</div>
								</li>
							</ul>
						</div>
					</div>																				  
				') if $dom->at('div.accordeon_'.$filter->{'parent_id'});
				
				$dom->at('ul.list_'.$filter->{'parent_id'})->append_content('
					<div class="accordeon-entry cat_'.$filter->{'parent_id'}.'">
						<div class="article-container style-1">
							<ul>
								<li class="child">
									<div class="accordeon_'.$item->{'category_id'}.'">
									</div>
								</li>
							</ul>
						</div>
					</div>																				  
				') if $dom->at('ul.list_'.$filter->{'parent_id'});
				
				$dom = $c->_megamenu( { parent_id => $item->{'category_id'} }, $level+1, $url );
				

			}
			else{
				
				if( $dom->at('div.accordeon_'.$item->{'parent_id'}) && !$dom->at('ul.list_'.$item->{'parent_id'}) ){
					if( $dom->at('div.accordeon_'.$item->{'parent_id'})->child_nodes->first ){
						$dom->at('div.accordeon_'.$item->{'parent_id'})->parent->parent->content ('<ul class="list_'.$item->{'parent_id'}.'" ><li><a href="'.$url.'">'.$item->{'title'}.'</a></li></ul>');
					}
					else{
						$dom->at('div.accordeon_'.$item->{'parent_id'})->append_content('<div class="accordeon-title">'.$item->{'title'}.'</div><div class="accordeon-entry"></div>');
					}
				}
				elsif( $dom->at('ul.list_'.$item->{'parent_id'}) ){
					$dom->at('ul.list_'.$item->{'parent_id'})->append_content('<li><a href="'.$url.'">'.$item->{'title'}.'</a></li>');
				}
				
			}
		}
	}
	
	$dom;
}

1;