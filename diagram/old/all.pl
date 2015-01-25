#!/usr/bin/perl

my @configurationName =  map { /^(.*)\./; $1 } glob '*.dot';

my $graph;
map { $graph .= "$_ -> " } @configurationName;
$graph .= $configurationName[0];

my @setup = map { "  $_ [image = \"$_.svg\" shape=box labelloc=\"b\" labeljust=\"r\" margin=\"2.0\"]\n" } @configurationName;

print<<EOF
digraph all {
@setup
  $graph
}
EOF
