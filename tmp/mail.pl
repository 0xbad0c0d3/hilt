use Data::Dumper;
use Mojo::Base 'Mojolicious';
use FindBin qw($Bin);
use Mail::RFC822::Address  qw(valid validlist);
use DBI;
use Mail::Sender;

my(@emails, @valids, @notvalid, @exists, @mail ) = (('flashersha@gmail.com'),(),(),(),());
my $report_notvalid = "$Bin/report.notvalid";
my $report_exists = "$Bin/report.exists";
my $report_error = "$Bin/report.error";

say "Start";
for my $item ( qw( report.notvalid report.exists  report.error) ){
	open (my $fh,'>',$report_error) or die $_;
	close($fh);
}
say "Init => OK";

say &send('flashersha@gmail.com');
#say &send('anthonyvizir@gmail.com');
#say &send('chat@hilt.com.ua');
exit;
for my $item ( @emails ) {
	if( valid($item) ){
		push @valids, $item;
	}
	else{
		push @notvalid, $item;
	}
}

if( @notvalid ){
	open (my $fh,'>',$report_notvalid) or die $!;
		say $fh "not valid emails: ". scalar @notvalid;
		say "not valid emails: ". scalar @notvalid;
		for my $item ( @notvalid ) {
			say $fh $item;
		}
	close( $fh );
}

if( my $dbh = &connect() ) {

	for my $item ( @valids ){
		my $res = $dbh->selectall_arrayref(
		"SELECT count(*) AS count FROM hilt_users WHERE ENCODE( email,  'xxsnvl4' ) = ?",
			{ Slice => {} },
			$item
		)->[0];
		
		if( $res->{'count'} ){
			push @exists, $item;
		}
		else{
			push @mail,	$item;
		}
	}
	$dbh->disconnect;
	
	if( @exists ){
		open (my $fh,'>',$report_exists);
			say $fh "exists emails: ". scalar @exists;
			say "exists emails: ". scalar @exists;
			for my $item ( @exists ) {
				say $fh $item;
			}
		close($fh);
	}
	
	for my $item ( @mail ) {
		my($ok,$err) = &send( $item );
		if( $ok ) {
			say $item . " => OK";
		}
		else{
			open (my $fh,'>>',$report_error);
			say $fh "$item => $err";
			close($fh);
		}
		sleep(1);
	}
	
}
else{
	say "MySQL connect error";
}

say "Finish";

sub send {
	my $to  = shift;
	my $sender = new Mail::Sender ({
		smtp => 'localhost',
		from => 'no-reply@hilt.com.ua',
		replyto => 'hotjobs@yandex.ru',
		skip_bad_recipients  => 1
	});
	
	my $subject = 'form hilt';
	
	$sender->OpenMultipart({
		to      => $to,
		subject => $subject,
	});
	
	$sender->Body;
	$sender->SendLineEnc("Test line 1");
	$sender->SendLineEnc("Test line 2");
	
	$sender->Close();
	if( $sender->{'error_msg'} ){
		say "mail error $to => ".$sender->{'error_msg'};
		return undef, $sender->{'error_msg'};
	};
	say Dumper( $Mail::Sender::Error );
	1;
}

sub connect {
	my $data_source = "dbi:mysql:database=hilt;host=dance.hilt.com.ua;port=3306";
	my $user = "newhilt";
	my $passwd = "JfVhC3VP";
	my $dbh = DBI->connect($data_source, $user, $passwd)
		or die $DBI::errstr;
	return $dbh;
}