package Core::Parser;

use strict;
use warnings;

sub replace;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}


sub replace
{
    my($self, $html, $lang) = @_;

    $html =~s/\%(LANG_\w+\d)\%/$lang->{$1}/gse;

    return $html
}

1;

