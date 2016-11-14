use v5.18;
use open qw(:std :utf8);
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use Data::Dumper;

use Spreadsheet::XLSX;
use Lingua::Translit;
use Schema;
use Encode qw(decode encode);
use Mojo::Util qw( trim );
use Mojo::UserAgent;

my ($cols,$data,$feature,$feature_index,$data_cols,$db_data,$data_h) = ([],[],[],{},{},[],{});
my $conf = do "${Bin}/../../conf/hilt.conf";
my $file = "${Bin}/../../docs/hilt_catalog.xlsx";

unless (-f $file){
    say "file: $file is not exists.";
    exit;
}

my $excel = Spreadsheet::XLSX->new( $file );
 
    for my $sheet (@{$excel -> {Worksheet}}) {
 
        printf("Sheet: %s\n", $sheet->{Name});
        
        $sheet -> {MaxRow} ||= $sheet -> {MinRow};
        
        for my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow}) {         
            $sheet -> {MaxCol} ||= $sheet -> {MinCol};
                
            for my $col ($sheet -> {MinCol} ..  $sheet -> {MaxCol}) {
                my $cell = $sheet -> {Cells} [$row] [$col];
                next if $row < 2;
                my $val = $cell->{Val} ? trim(decode('utf-8', $cell->{Val} )) : '';
                $val = translit($val);
                if ( $col == 0 && $val ){
                    push @{$data}, $val;
                }
                if ( $col == 1 && $val) {
                    
                }
                #printf("( %s , %s ) => %s\n", $row, $col, $val );
            }
        }
 
    }
        
    
    say Dumper( $data );

sub translit {
    my $tr = new Lingua::Translit("GOST 7.79 RUS");
    my $txt = $tr->translit( shift );
    $txt =~s/[^0-9A-Z\s\/-]//ig;
    $txt =~s/\s+/-/ig;
    lc($txt);    
}