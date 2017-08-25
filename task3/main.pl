#!/usr/bin/perl;


use strict;
use warnings;

use Data::Dumper;
use lib qw(libs);

use Core::File;
use Core::Hash;
use Core::Parser;
use Core::DB;
use Core::XML;

my @arr;
my $html;
my $lang;
my $file;
my $hash;
my $parser;
my $pathFileTxt = 'files/file.txt';
my $pathFileHtml = 'files/index.html';
my $pathFileXml = 'files/file.xml';

$file = Core::File->new();
@arr = $file->readFile($pathFileTxt);
$html = $file->readFile($pathFileHtml);

#$hash = Core::DB->new();
#$lang = $hash->makeHash('hash');

$hash = Core::XML->new();
$lang = $hash->makeHash($pathFileXml);

$parser = Core::Parser->new();
print Dumper($parser->replace($html, $lang));

