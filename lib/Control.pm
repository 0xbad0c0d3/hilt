package Control;
use Mojo::Base 'Mojolicious';
use FindBin qw($Bin);
use Mojolicious::Plugin::Cache;
use Mojo::Log;

my($r, $api, $conf, $admin);

$ENV{MOJO_MAX_MESSAGE_SIZE} = 1_073_741_824;
$ENV{MOJO_CONFIG} = "$Bin/../conf/hilt.conf";


sub startup {
	my $self = shift;

	#$self->app->mode('production');
	$self->plugin('Config');
	$self->config( hypnotoad => $self->app->config->{'hypnotoad'} );
	$self->log(Mojo::Log->new( path => '/var/www/hilt.mojo/logs/hilt.log', level => 'info' ));
		
	$self->secrets($self->app->config->{'secrets'});
	$self->sessions->cookie_name( $self->app->config->{'session'}->{'cookie_name'} );
	
	$self->sessions->default_expiration($self->app->config->{'session'}->{'default_expiration'});
	$self->sessions->secure($self->app->config->{'session'}->{'secure'});

	$self->plugin('Control::Plugin::Session');
	$self->plugin('Control::Plugin::Pages');
	$self->plugin('Control::Plugin::Pagination');
	#$self->plugin('Control::Plugin::Utils');
	$self->plugin('Control::Plugin::MAIL');
	$self->plugin('Control::Plugin::Markdown');
	$self->plugin('Control::Plugin::DB');
	$self->plugin('Control::Plugin::Admin');
	$self->plugin('Control::Plugin::Image');
	
	$self->plugin('Model');
	$self->plugin('AccessControl');
	$self->plugin('RemoteAddr');
	$self->plugin('DBICAdmin');

	#$self->plugin('cache-page' => $self->app->config->{'cache'}->{'page'} );

	$self->plugin('OAuth2' => $self->app->config->{'OAuth2'} );
	
	$self->helper(
		timed => sub  {
			my $c = shift;
			if ( my $started = $c->stash->{'mojo.started'} ) {
				my $timed = sprintf '%f', Time::HiRes::tv_interval($started, [ Time::HiRes::gettimeofday() ]);
				#my $rps  = $elapsed == 0 ? '??' : sprintf '%.3f', 1 / $elapsed;
				$c->stash('timed',"${timed}s");
			}
		}		
	);

	$self->helper(
		c_init => sub  {
			my $c = shift;
			my $par = shift;
			my $data = {};
			$data->{'data'} = $c->req->json();
			$data->{'data'} = $c->req->params->to_hash() if ( $c->req->params );

			$data->{'page'} = $data->{'data'}->{'page'} ? $data->{'data'}->{'page'} : 1;
			$data->{'rows'} = $data->{'data'}->{'rows'} ? $data->{'data'}->{'rows'} : $self->app->config->{'list'}->{'rows'};
			$data->{'db'} = $c->db;
			$data->{'id'} = $data->{'data'}->{'id'} || $c->stash('id');
			return $data;
		},
		form_secure_check => sub {
			my $c = shift;
			my $secure = shift or do { return undef };
			my $session = $c->session( $c->app->config->{'session'}->{'cookie_name'} );
			$secure == $session->{ $c->app->config->{'form'}->{'form_secure_name'} } ? 1 : 0;
		}
	);		

	$self->plugin( 'tt_renderer' => $self->app->config->{'tt_renderer'} );
	
	$self->hook( before_render => sub {
		my ($c, $args) = @_;
		if ( $args->{'exception'} ) {
			# при проблемах с контроллером, готовим свой %snapshot для передачи на страницу ошибки
		}
		$c->stash( {error =>  $c->flash('error')} ) if $c->flash('error');
		$c->timed;
		return 1;
	});
	
    $self->hook(
        before_routes => sub {
            my ($c) = @_;

			my $token = $c->req->headers->header('X-CSRF-Token') || $c->param('csrf');
			my $user = $c->session( $self->config->{'session'}->{'cookie_name'} );

            if ( $token && $token ne $user->{'csrf'} ) {
				my $path = $c->tx->req->url->to_abs->to_string;
                $c->app->log->debug("CSRFProtect: Wrong CSRF protection token for [$path]!");
				return $c->render( status => 403, text => "Forbidden!" );
            }
			

            return 1;
        }
	);	

	# Router
	$r = $self->routes->over(
		'access' => [
			#allow => 'allowhost.com',
			#allow => '127.0.0.1',
			#allow => '192.168.0.163',
			#deny  => '192.168.0.0/24',
			#allow  => 'all'
			allow => 'all'
		]
	)->over( session => 1 );
	
	$r->get('/popup/:item' => [ format => ['html','json'] ] )->to('popup#item');
	
	$r->get('/catalog/*path/:html' => [ format => ['html'] ] )->to('catalog#item');
	$r->get('/catalog/*html' => [ format => 'html' ] )->to('catalog#default');
	$r->get('/catalog/*path')->to('catalog#default');
	$r->get('/catalog')->to('catalog#default');
	
	$r->get('/news/*html' => [ format => ['html'] ] )->to('news#item');
	$r->get('/news')->to('news#default');
	
	$r->get('/compare')->to('compare#default');
	
	$r->get('/events/*path/:html' => [ format => ['html'] ] )->to('events#item');
	$r->get('/events/*html' => [ format=>'html' ] )->to('events#default');
	$r->get('/events/*path')->to('events#default');
	$r->get('/events')->to('events#default');
	
	$r->get('/profile/*html' => [ format => ['html'] ])->to('profile#default');
	$r->get('/profile')->to('profile#default')->name('profile');
	$r->post('/profile/info/update')->to('profile#info_update');
	
	$r->get('/login/confirm')->to('system#login_confirm');
	$r->get('/login/login-confirm-error')->to('system#login_confirm_error');
	$r->get('/logout')->to('system#logout');
		
	
	####################
	$api = $r->any('/api');
		# users
		$api->post('/user')->over( is_admin => 1 )->to('api-user#set');
		$api->put('/user')->over( is_admin => 1 )->to('api-user#update');
		$api->delete('/user')->over( is_admin => 1 )->to('api-user#remove');
		$api->get('/user/list')->over( is_admin => 1 )->to('api-user#list');
		$api->get('/user/:id' => [ format => ['json'], id => qr/\d+/  ]  )->over( is_admin => 1 )->to('api-user#get');
		$api->post('/user/login' => [ format => ['json'] ] )->to('api-user#login');
		$api->post('/user/login/confirm' => [ format => ['json'] ]  )->to('api-user#login_confirm');
		$api->post('/user/logout' => [ format => ['json'] ] )->to('api-user#logout');
		###########################################################################
		# content
		###########################################################################
		# product
		$api->delete('/content/product')->to('api-content-product#remove');
		$api->put('/content/product')->to('api-content-product#update');
		$api->post('/content/product/set')->to('api-content-product#set');
		$api->get('/content/product/list')->to('api-content-product#list');
		$api->get('/content/product/:id' => [ format => ['json'], id => qr/\d+/  ] )->to('api-content-product#get');
		# static page
		$api->delete('/content/page')->to('api-content-page#remove');
		$api->put('/content/pege')->to('api-content-page#update');
		$api->post('/content/page/set')->to('api-content-page#set');
		$api->get('/content/page/list')->to('api-content-page#list');
		$api->get('/content/page/:id' => [ format => ['json'], id => qr/\d+/  ] )->to('api-content-page#get');
		# categoty
		$api->delete('/content/category')->to('api-content-category#remove');
		$api->put('/content/category')->to('api-content-category#update');
		$api->post('/content/category/set')->to('api-content-category#set');
		$api->get('/content/category/list')->to('api-content-category#list');
		$api->get('/content/category/:id' => [ format => ['json'], id => qr/\d+/  ] )->to('api-content-category#get');
		# feature
		$api->delete('/content/feature')->to('api-content-feature#remove');
		$api->put('/content/feature')->to('api-content-feature#update');
		$api->post('/content/feature')->to('api-content-feature#set');
		$api->get('/content/feature/list')->to('api-content-feature#list');
		$api->get('/content/feature/:id')->to('api-content-feature#get');
		# images
		$api->delete('/image/product/:id' )->over( is_admin => 1 )->to('api-image-product#delete');
		$api->post('/image/product/:id' )->to('api-image-product#set');
		$api->get('/image/product/list/:id' )->over( is_admin => 1 )->to('api-image-product#list');
		$api->get('/image/product/:id')->over( is_admin => 1 )->to('api-image-product#get');
	
	####################
	# admin
	####################
	$admin = $r->any('/admin')->over( is_admin => 1 );
		$admin->get('/')->to('admin-pages#index')->name('admin-pages-index');
		
		#
		# Category
		#
		$admin->get('/content/category')->to('admin-content#index');
		#
		# Product
		#
		$admin->get('/content/product')->to('admin-content-product#list');
		$admin->get('/content/product/:id')->to('admin-content-product#item');
		
		$admin->get('/content/feature')->to('admin-feature#index');
		$admin->get('/content/sales')->to('admin-sales#index');
		
		$admin->get('/marketing/mail')->to('admin-mail#index');
		#
		# Images
		#
	
	####################
	
	$r->get('/*html' => [ format => ['html'] ])->to('pages#static');	
	$r->any('/')->to('pages#index')->name('index');
}

1;
