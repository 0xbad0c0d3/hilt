package Control::Model::Feature;
use Mojo::Base 'MojoX::Model';
use Try::Tiny;
use Data::Dumper;
use Mojo::Util qw(trim);

my ($r,$count,$rs,$exception,$id,@trim) = ('',0,0,'',());

sub _init {
  my $model = shift;
  1;
}

sub get {
  my ($model, $cid) = @_;
  my $db = $model->app->db;  
  $r = $db->resultset('Feature')->find( { feature_id => $cid }  );  
  my %h = ();
  for my $key ( $r ? $r->columns : () ) {
    $h{$key} = $r->$key;
  }
  \%h;					
}

sub set {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());  
  @data = @{ $data };
	@trim = qw(title title_en);
  
  $db->storage->txn_begin();
  try {
    for my $item ( @data ) {
      next unless ref $item eq 'HASH';
			
			for my $t ( @trim ){
				$item->{ $t } = trim( $item->{ $t } ) if exists $item->{ $t };
			}
      
			$r = $db->resultset('Feature')->search( {
					title => trim( $item->{'title'} ),
					title_en => trim( $item->{'title_en'} )
				}, {
					columns => qw(feature_id)
			});
			
      if ( my $cd = $r->next  ) {
				$id = $cd->get_column('feature_id');
				
        push @res, { feature_id => $id, title => $item->{'title'}, title_en => $item->{'title_en'} };
        next;
      }

			%data =  map { $_ => $item->{$_} } grep { $_ !~ /feature_id/i } keys %{ $item };
      
      my $res = $db->resultset('Feature')->create( \%data );
      my $id = $res->feature_id;
      push @res, { feature_id => $id, message => "create"};
    }
    $db->storage->txn_commit();
    return \@res;    
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };
  
}

sub update {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res) = ((),());  
  @data = @{ $data };
  @trim = qw(feature_id title title_en);
	
  $db->storage->txn_begin();
  try {
    for my $item ( @data ) {
      next unless ref $item eq 'HASH';
			
			for my $t ( @trim ){
				$item->{ $t } = trim( $item->{ $t } ) if exists $item->{ $t };
			}
			
      $r = $db->resultset('Feature')->find( { feature_id => $item->{'feature_id'} }  );
      unless ($r) {
        push @res, { feature_id => $item->{'feature_id'}, message => "not exists"};
        next;
      }
			for my $key ( grep { $_ ne 'feature_id' } keys %{$item} ) {
				if( $r->has_column( $key ) ){
					$r->$key( $item->{$key} );
				}
			}
			if ( $r->has_column('date_update') ) {
				$r->date_update(\'NOW()');
			}	  
      $r->update;
      push @res, { category_id => $item->{'feature_id'}, message => "update"};
    }
    $db->storage->txn_commit();
    return \@res;    
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };
}

sub remove {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res) = ((),());  
  @data = @{ $data };
  
  $db->storage->txn_begin();
  try {
    for my $id ( @data ) {
      $r = $db->resultset('Feature')->find( { feature_id => $id }  );
      unless ($r) {
        push @res, { feature_id => $id, message => "not exists"};
        next;
      }
			$r->delete;
			push @res, { feature_id => $id, message => "remove"};
    }
    $db->storage->txn_commit();
    return \@res;    
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };  
}

sub list {
  my ($model, $page, $rows ) = @_;
  my $db = $model->app->db;
  $r = $db->resultset('Feature')->search( undef,{
    rows => $rows,
    page => $page
  });  
  $r->result_class('DBIx::Class::ResultClass::HashRefInflator');  
  my @res = $r->all();
  
  $rs = $db->resultset('Feature')->search(
    undef,
    {
      select => [
        { count => 'feature_id' }
      ],
      as => [ 'count' ]
    }
  );
  
  $count = $rs->next->get_column('count');  
  { success =>\1, count=> $count, page => $page, rows => $rows,  data=>\@res };
}


sub feature2value_set {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());  
  @data = @{ $data };
  @trim = qw(feature_id type_id value);

  
  $db->storage->txn_begin();
  try {
    for my $item ( @data ) {
      next unless ref $item eq 'HASH';

			for my $t ( @trim ){
				$item->{ $t } = trim( $item->{ $t } ) if exists $item->{ $t };
			}
      
			$r = $db->resultset('Feature2value')->search( {
					feature_id => $item->{'feature_id'},
					type_id => $item->{'type_id'},
					value => $item->{'value'}
				}, {
				select => [
					{ count => 'feature_id' }
				],
				as => [ 'count' ]
			});
			
      if ( $count = $r->next->get_column('count') ) {				
        push @res, { feature_id => $id, type_id => $item->{'type_id'}, value => $item->{'value'} };
        next;
      }			

			%data =  map { $_ => $item->{$_} } keys %{ $item };
      
      my $res = $db->resultset('Feature2value')->create( \%data );
      my $id = $res->feature_id;
      push @res, { feature_id => $id, message => "create", data => \%data };
    }
    $db->storage->txn_commit();
    return \@res;    
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };
	
}


sub feature2value_get {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());  
}


sub feature2value_update {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());  
}


sub feature2value_remove {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());  
}
1;