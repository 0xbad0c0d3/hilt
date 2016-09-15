use Data::Dumper;
use Mojo::UserAgent;
use Mojo::UserAgent::CookieJar;
use Mojo::URL;

my $cookie_jar = Mojo::UserAgent::CookieJar->new;

my $url = "http://example.com/rt";
my $ua = Mojo::UserAgent->new;

my $tx = $ua->post($url => form => { user => 'myuser', pass => 'mysecret' });
say "XXX set_cookie: ". $tx->res->headers->set_cookie;

$cookie_jar->add( $ua->cookie_jar->all );

# or just some of them
# $cookie_jar->add( $ua->cookie_jar->find( Mojo::URL->new($url) );

# reuse cookie-jar in new UserAgent
my $ua2 = Mojo::UserAgent->new;
$ua2->cookie_jar( $cookie_jar );

my $q_url = Mojo::URL->new( $url . "REST/1.0/search/ticket" );
$url->query({ query => q{Requestor.EmailAddress LIKE 'alister@example.com'} });
say "XXX response: " . $ua2->get($url, { Referer => $rturl })->res->body;