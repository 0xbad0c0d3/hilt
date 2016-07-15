package Control::Plugin::Image;
use Mojo::Base 'Mojolicious::Plugin';
use Image::Resize;
use Image::Scale;
use Digest::MD5::File qw(dir_md5_hex file_md5_hex url_md5_hex);
use File::Path qw(make_path remove_tree);
use File::Copy;
use Data::Dumper;

sub register {
	my ($self,$app) = @_;
	
	$app->helper( img_resize => sub {
		my ($c, $id, $file_tmp, $tmp_path, $path, $name, $w, $h, $q) = @_;
		return undef unless ( $id && $file_tmp && $tmp_path && $path && $name && $w && $h );
		my $rnd = time.int(rand(100));
		make_path($path, { chmod => 0777 } ) unless -d $path;
		my $image = Image::Resize->new( $file_tmp );
		$w = $image->width() > $w ? $w :  $image->width();
		$h = $image->height() > $h ? $h :  $image->height();
		my $gd = $image->resize( $w, $h );
		my $f = $tmp_path . "/" . $rnd;
		open(FH, '>', $f) or die $!;
			binmode(FH);
			print FH $gd->jpeg($q);
		close(FH);
		my $d = file_md5_hex( $f );
		$d =~/(..)(..)/i;
		my $new_path = "$path/$1/$2";
		make_path($new_path, { chmod => 0777 } ) unless -d $new_path;
		$name=~s/\.\w+?$/\.jpg/i;
		my $new_f = "$new_path/$name";
		copy($f, $new_f) or die $!;
		unlink( $file_tmp );
		unlink( $f );
		$new_f;
	});
	
	# XS only file_tmp !!! not fh
	$app->helper( img_scale => sub {		
		my ($c, $id, $file_tmp, $tmp_path, $path, $name, $w, $h, $q) = @_;
		return undef unless ( $id && $file_tmp && $tmp_path && $path && $name && $w && $h );
		$name=~/\.(\w+)?$/i;
		my $format = lc($1);
		my $rnd = time.int(rand(100));
		make_path($path, { chmod => 0777 } ) unless -d $path;
		my $image =  Image::Scale->new( $file_tmp );
		$w = $image->width() > $w ? $w :  $image->width();
		$h = $image->height() > $h ? $h :  $image->height();
		$image->resize_gd( { width => $w } ) if $w;
		$image->resize_gd( { height => $h } ) if $h;		
		my $f = $tmp_path . "/" . $rnd;
		if( $format=~/png/ ){
			$image->save_png($f);	
		}
		else{
			$image->save_jpeg($f,$q);
		}		
		my $d = file_md5_hex( $f );
		$d =~/(..)(..)/i;
		my $new_path = "$path/$1/$2";
		make_path($new_path, { chmod => 0777 } ) unless -d $new_path;		
		my $new_f = "$new_path/$name";
		copy($f, $new_f) or die $!;
		unlink( $file_tmp );
		unlink( $f );
		$new_f;		
	});

	
	return 1;
}

1;