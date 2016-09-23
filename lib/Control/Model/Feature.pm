package Control::Model::Feature;
use Mojo::Base 'MojoX::Model';
use Try::Tiny;
use Data::Dumper;

my ($r,$count,$rs,$exception,$id,@trim) = ('',0,0,'',());

sub _init {
  my $model = shift;
  1;
}

sub get {
  my ($model, $data) = @_;
  my $db = $model->app->db;  
  $r = $db->resultset('Feature')->find( $data );  
  my %h = ();
  for my $key ( $r ? $r->columns : () ) {
    $h{$key} = $r->$key;
  }
  %h ? \%h : undef;
}

sub set {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my %columns = map{ $_ => 1 } $db->source("Feature")->columns;
  my ($feature,$value) = ( {},'' );
  
  for my $key ( keys %{ $data } ) {
    my $find = 0;
    if( !$find && exists $columns{$key} && $key !~/^(feature_id)$/i ) {
      $feature->{ $key } = $data->{ $key };
    }    
  }
  
  $db->storage->txn_begin();
  try {			
    my %h = ();
    my $res = $db->resultset('Feature')->create( $feature );
    my $id = $res->feature_id;    
    %h = map { $_ => $res->$_ } keys %columns;
    $db->storage->txn_commit();
    return \%h;
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };
  
}

sub update {
  my ( $model, $feature_id, $data ) = @_;
  my $db = $model->app->db;
  my $feature = {};  
	
  $db->storage->txn_begin();
  
  try {			    
    $r = $db->resultset('Feature')->find( { feature_id => $feature_id }  );
    if ($r) {        
			for my $key ( grep { $_ !~ /^(feature_id|data_create)$/i } keys %{ $feature } ) {
				if( $r->has_column( $key ) ){
					$r->$key( $feature->{$key} );
				}
			}
			if ( $r->has_column('date_update') ) {
				$r->date_update(\'NOW()');
			}	  
      $r->update;
    }
    $db->storage->txn_commit();
    return $feature;    
  
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


sub set_feature2product {
  my ( $model, $product_id, $feature ) = @_;
  my $db = $model->app->db;
  my ($data, $res, $res2) = ([],undef,undef);
  
  #
  # Название характеристики
  #
  for my $title ( keys %{ $feature } ){
    $res = $model->get( { title => $title } );
    if( $res ){
      $res->{'value'} = $feature->{ $title }; 
      push @{$data}, $res;
    }
    else{
      $res2 = $model->set( { title => $title, user_id => 1 } );
      if ( $res2 ) {
        $res2->{'value'} = $feature->{ $title }; 
        push @{$data}, $res2;
      }
    }
  } # for
  
  #
  # Значение характеристики
  #
  for my $item ( @{ $data } ){
    my %feature2value = ();
    
    if( $item->{'value'} && ref $item->{'value'} eq "HASH" ){    
      %feature2value = %{ $item->{'value'} };     
    }
    else{
      %feature2value = ( $item->{'value'} => '' );
    }
    
    while ( my ($key,$value) = each %feature2value ) {      
      
      my $res = $model->get_feature2value({
        feature_id => $item->{'feature_id'},
        value => $key
      });
      
      unless ( $res ) {
        $res = $model->set_feature2value( {
          feature_id => $item->{'feature_id'},
          value => $key
        } );
      }
      
      #
      # Связка с продуктом + дополнительное значение
      #
      if( $value ){
        
      }
      
      #say Dumper('feature2value', $res);
    }
    
  } # for
}

sub set_feature2value {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my ($columns, $feature2value ) = ([],{});  
  
  @{$columns} = $db->source('Feature2value')->columns;
  
  for my $item ( grep { $_ !~ /^(feature2value_id)$/i } @{$columns} ) {
    $feature2value->{ $item } = $data->{ $item }
      if $data->{ $item };
  }
  
  $db->storage->txn_begin();
  try {
    my %h = ();
    my $res = $db->resultset('Feature2value')->create( $feature2value );
    %h = map { $_ => $res->$_ } @{$columns};
    $db->storage->txn_commit();
    return \%h;    
  }
  catch {
    my $err = $_;
    $db->storage->txn_rollback();
    return undef, $err;
  };
	
}

sub get_feature2value {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my ($columns, $feature2value ) = ([],{});
  my %h = ();

  @{$columns} = $db->source('Feature2value')->columns;
  
  for my $item ( @{$columns} ) {
    $feature2value->{ $item } = $data->{ $item }
      if $data->{ $item };
  }
    
  my $res_rs = $db->resultset('Feature2value')->search( $feature2value );
  my $res = $res_rs->next;
  if( $res ) {
    %h = map { $_ => $res->$_ } @{$columns};
  }
  
  return %h ? \%h : undef;  
}


sub update_feature2value {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my ($columns, $feature2value ) = ([],{});
  my %h = ();
  
  @{$columns} = $db->source('Feature2value')->columns;

  my $res = $db->resultset("Feature2value")->find( {
    feature2value_id => $data->{ 'feature2value_id' }
  });

  if( $res ){

    $db->storage->txn_begin();  
    try {
      for my $item ( grep { $_ !~ /feature2value_id/i } @{$columns} ){
        $res->$item( $data->{ $item } );
      }
      if ( $r->has_column('date_update') ) {
        $r->date_update(\'NOW()');
      }	      
      $res->update();
      $db->storage->txn_commit();
      return $data;
    }
    catch {
      my $err = $_;
      $db->storage->txn_rollback();
      return undef, $err;      
    };
    
  }
  
  return undef;
}

sub remove_feature2value {
  my ( $model, $data ) = @_;
  my $db = $model->app->db;
  my (@data, @res, %data) = ((),(),());
}

1;