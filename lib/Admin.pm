package Admin;
use Mojo::Base 'Mojolicious';

my $project_name = 'hilt';
my($r);
$ENV{MOJO_MAX_MESSAGE_SIZE} = 1_073_741_824;

sub startup {
	my $self = shift;

	#$self->app->mode('production');
	$self->app->config->{'project_name'} = $project_name;
	
	$self->secrets(['JHQkdwdw8&*hfhdsdf98Mjhh']);
	$self->sessions->cookie_name('__sid');
	$self->sessions->default_expiration(3600 * 60 * 24);
	$self->sessions->secure(1);  

	$self->plugin('Control::Plugin::Session');
	$self->plugin('Control::Plugin::Auth');
	$self->plugin('Control::Plugin::Pages');
	$self->plugin('Control::Plugin::Pagination');
	
	$self->plugin('Model');
	$self->plugin('AccessControl');
			
	$self->plugin('tt_renderer' => {
		template_options => {
			PRE_CHOMP => 1,
			POST_CHOMP => 1,
			TRIM => 1,
			ENCODING => 'UTF-8',
			COMPILE_DIR => 'cache/pages'
		}
	});
			   
	# Router
	$r = $self->routes->over( session => 1 )->over(
		'access' => [
			#allow => 'allowhost.com',
			allow => '127.0.0.1',
			allow => '192.168.0.163',
			#deny  => '192.168.0.0/24',
			allow  => 'all'
		]
	);

	$r->any('/:controller/:action' => [ format => ['html','json'] ] )->to( controller=> 'admin-base', action => 'hello');	
	$r->any('*')->to('pages#index')->name('index');
}

1;
