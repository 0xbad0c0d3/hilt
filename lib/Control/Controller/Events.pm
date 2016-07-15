package Control::Controller::Events;
use Mojo::Base 'Mojolicious::Controller';

sub default {
  my $c = shift;
  $c->render(template => 'pages/events');
}

1;
