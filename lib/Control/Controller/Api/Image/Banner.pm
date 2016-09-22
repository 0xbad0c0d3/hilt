package Control::Controller::Api::Image::Banner;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

my ( $files, $m, $ms, $id, $data, $init, $tmp_path_dir, $banner_conf ) = ('', '', '', 0, [], {},'', {});
my $q = 90;

sub _init {
	my $c = shift;
	$m = $c->model('Image');
	$init = $c->c_init();
	$id = $init->{'id'};
	$data = $init->{'data'};
	$files = $c->req->every_upload('files');
	$tmp_path_dir = $c->app->config->{'image'}->{'tmp_path_dir'};
	$banner_conf = $c->app->config->{'image'}->{'banner'},
	$m && $files ? 1 : 0;	
}


sub list_main {
	my $c = shift;
	$c->_init;
	my $json = $m->banner_list_main();
	$c->render( json => $json );
}

sub add_main {
	my $c = shift;
	my @errors = ();
	if($c->_init){ #There is some files to upload
		my %defaults = (
			sort => 0,
			valid_from => \'NOW()',
			position => 0
		);
		my @banners = ();
		for my $file (@{$files}){
			my $info = $c->_make_persistent('main',$file);
			$info->{user_id} = 1;
			for (('sort','url','position','text','valid_from','valid_till')){
				if(!defined(($info->{$_} = exists($data->{$_})?$data->{$_}:$defaults{$_}))){
					$c->app->log->warn("image->banner the required param '$_' does not present");
					return $c->render( json => { success => \0, error => "$_ required" } );
				}
			}
			($banners[$#banners+1],$errors[$#errors+1]) = $m->banner_add_main($info);
			delete($banners[$#banners]) if !defined($banners[$#banners]);
			delete($errors[$#errors]) if !defined($errors[$#errors]);
		}
		if(@banners){
			return $c->render( json => { success => \1, data => \@banners });
		}
	}
	$c->render( json => { success => \0, errors => \@errors });
}


sub _make_persistent {
	my($c,$type,$file)=@_;
	my $filename = $file->filename =~ s/[^\w\d\.]+/_/gr;
	my $tmp_banner = $file->move_to($tmp_path_dir."/".$filename);
	my $w = $banner_conf->{$type}->{max_w};
	my $h = $banner_conf->{$type}->{max_h};
	my $info = {
		w => $w,
		h => $h,
		%{
			$c->img_resize(
				"",
				$tmp_path_dir."/".$filename,
				$tmp_path_dir,
				$banner_conf->{$type}->{path},
				$filename,
				$w,
				$h,
				$banner_conf->{$type}->{q}
			)
		}
	};
	$c->img_tmp_remove($tmp_banner);
	return $info;
}
