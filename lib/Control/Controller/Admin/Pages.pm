package Control::Controller::Admin::Pages;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ($m);
sub _init {
	my $c = shift;
	#$m = $c->model('admin');
	1;
}

sub index {
	my $c = shift;
	return $c->reply->not_found unless $c->_init();
	my $u = $c->stash('user');
	$c->app->log->info("admin in main page: ".$u->{first_name}." ".$u->{last_name});
	$c->render( template => 'admin/index');
}

1;