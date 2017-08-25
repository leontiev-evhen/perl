package Core::DB;

use strict;
use warnings;

use Data::Dumper;
use DBI;

sub makeHash;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}


sub makeHash
{
    my($self, $table) = @_;
    my %hash = ();
    my $dbh = DBI->connect("DBI:mysql:user11:localhost","user11", "tuser11");
    my $query = $dbh->prepare("SELECT * FROM $table");
    $query->execute();
    while (my $row = $query->fetchrow_hashref()) {
       $hash{$row->{'key'}} = $row->{'value'};
    }
    $query->finish();
    $dbh->disconnect();
    
    #print Dumper(\%hash);
    return \%hash;
}

1;

