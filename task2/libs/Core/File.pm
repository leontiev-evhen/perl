package Core::File;

use strict;
use warnings;

sub readFile;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub readFile
{
    my @data = ();
    my($self, $file) = @_;

    open my $fh, "< $file";
    binmode($fh);

    while(<$fh>)
    {
        chomp($_);
        push @data, $_;
    }

    close $fh;

    if (wantarray)
    {
        return @data;
    }
    else
    {
        return join("/n", @data);
    }
}

1;
