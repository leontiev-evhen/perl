#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;

my @arr = ();
my $lang = ();
my $html = '';

sub readFile
{
    my @data = ();
    my($file) = @_;

    open my $fh, "< $file";

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

sub makeHash
{
    my @data = @_;
    my %hash = ();

    while (@data)
    {
        my $line = shift @data;
        my($key, $value) = split("=>", $line);
        $hash{$key} = $value if($key);
    }
    return \%hash;
}

sub replace
{
    my($html, $lang) = @_;
    
    $html =~s/\%(LANG_\w+\d)\%/$lang->{$1}/gse;

    return $html
}

@arr = readFile('file.txt');
$html = readFile('index.html');

$lang = makeHash(@arr);
print replace($html, $lang);
