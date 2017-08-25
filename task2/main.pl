#!/usr/bin/perl;

use strict;
use warnings;

use Data::Dumper;
use lib qw(libs);

use Core::File;
use Core::Hash;
use Core::Parser;

my @arr;
my $html;
my $lang;
my $file;
my $hash;
my $parser;
my $pathFileTxt = 'files/file.txt';
my $pathFileHtml = 'files/index.html';

$file = Core::File->new();
@arr = $file->readFile($pathFileTxt);
$html = $file->readFile($pathFileHtml);

$hash = Core::Hash->new();
$lang = $hash->makeHash(@arr);

$parser = Core::Parser->new();
print Dumper($parser->replace($html, $lang));

