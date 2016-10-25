package Control::Model::Event;
use Mojo::Base 'MojoX::Model';
use Try::Tiny;
use Data::Dumper;

sub get_event {
    my $model = shift;
    my $data = shift or do {
        return undef;
    };
    
    my $db = $model->app->db;
    my $h = {};
	my $res = $db->resultset('VSaleInfo')->find( $data );
    
	if( $res ){
		for my $key ( $res->columns ) {
			$h->{ $key } = $res->$key if defined $res->$key;
		}
		return $h;
	}
    
    return undef;
}

sub get_product2sale {
    my $model = shift;
    my $sale_id = shift;
    my $page = shift;
    my $rows = shift;
    my $db = $model->app->db;

	my $res = $db->resultset('VProduct2sale')->search(
        {
            sale_id => $sale_id
        },
        {
            rows => $rows,
            page => $page,
        }
    );  
	$res->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	
    my @res = $res->all();
	my $rs = $db->resultset('VProduct2sale')->search(
		{ sale_id => $sale_id },
		{
			select => [
				{ count => 'sale_id' }
			],
			as => [ 'count' ]
		}
	);
	
	my $count = $rs->next->get_column('count');

	my @products = ();
	for my $item ( @res ){
        my $m = $model->app->model('Product');
		my $data = $m->get_v_product_info({ category_id => $item->{'category_id'}, product_id => $item->{'product_id'} });
		$item->{'data'} = $data if %{$data};
		push @products, $item->{'product_id'} if $data->{'quantity'};
	}
	
    return {
        success => \1,
        count => $count,
        page => $page,
        rows => $rows,
        data => \@res
    };    
}

sub list {
	my ($model, $page, $rows ) = @_;
	my $db = $model->app->db;	
	
	my $res = $db->resultset('VSaleInfo')->search( undef,{
		rows => $rows,
		page => $page,
		#order_by => ['sort']
	});  
	$res->result_class('DBIx::Class::ResultClass::HashRefInflator');  
	my @res = $res->all();
	
	my $rs = $db->resultset('VSaleInfo')->search(
		undef,
		{
			select => [
				{ count => 'sale_id' }
			],
			as => [ 'count' ]
		}
	);
	
	my $count = $rs->next->get_column('count');  
	
    return {
        success => \1,
        count => $count,
        page => $page,
        rows => $rows,
        data => \@res
    };
}

sub get_product2event {
    my $model = shift;
    my $sale_id = shift;
    my $attr = shift;
    my $db = $model->app->db;
    my ($res, $data, @res) = ([],undef,());
    
    if( $sale_id ){
        $data = {
            sale_id => $sale_id 
        };
    }

    $res = $db->resultset('VProduct2sale')->search($data,{
		rows => $attr->{'rows'},
		page => $attr->{'page'}        
    });
    
    $res->result_class('DBIx::Class::ResultClass::HashRefInflator');  
    @res = $res->all();        
    
	my $rs = $db->resultset('VProduct2sale')->search(
		$data,
		{
			columns => [ qw/product_id/ ],
			distinct => 1
		}
	);
	  
	my $count = $rs->count;
    
    return {
        success =>\1,
        count => $count,
        page => $attr->{'page'},
        rows => $attr->{'rows'},
        data=>\@res,
    };
}

1;