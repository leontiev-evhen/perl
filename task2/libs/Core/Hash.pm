package Core::Hash;

use strict;
use warnings;

sub makeHash;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}


sub makeHash
{
    my ($self, @data) = @_;
    my %hash = ();

    while (@data)
    {
        my $line = shift @data;
        my($key, $value) = split("=>", $line);
        $hash{$key} = $value if($key);
    }
    return \%hash;
}

1;
