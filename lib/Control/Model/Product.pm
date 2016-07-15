package Control::Model::Product;
use Mojo::Base 'MojoX::Model';

my %prod = (
  product_id => 0,  
  title => 'Майка Ника фиолетовая',
  description => 'Майка на тонких бретельках, выполненная из приятной к телу натуральной ткани, обеспечит Вам удобство и комфорт.',
  img => ['/site/images/0630559.jpg', '/site/images/0630559.jpg', '/site/images/0630559.jpg'],
  brand => 'Lans',
  price => {
	prev => 142,
	current => 57,
  },
  features => {
	size => ['s','m','xl','xxl'],
	color => [ ['blue','blue'], ['while','#fff'],['black','#000'] ]
  }
);

sub get_products {
  my $c = @_;    
  my @products = ();
  
  for my $item ( 1..8 ) {
	my $id = sprintf( "%08d", int( rand(100_000) ) );
	$prod{'product_id'} = sprintf( "%08d", $id);
	$prod{'url'} = "/catalog/clothing-and-shoes/he/jackets-coats/${id}-swimsuit-in-ethnic-style.html";
	push @products, \%prod;
  }	
  return \@products;
}

sub get_product_item {
  my $c = shift;
  return {};
}

1;