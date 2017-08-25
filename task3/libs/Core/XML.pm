package Core::XML;

use strict;
use warnings;

use Data::Dumper;
use XML::Simple;

sub makeHash;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}


sub makeHash
{
    my($self, $xmlFile) = @_;
    my $simple = XML::Simple->new();
    my $hash = $simple->XMLin($xmlFile);
    return $hash;
}

1;

