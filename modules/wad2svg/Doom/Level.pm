#!/usr/bin/perl -w
# Copyright 2002 by Colin Phipps
# You are permitted to redistribute this software providing the copyright and
#  authoring notices remain attached - see the file COPYING for details

use strict;

package Doom::Level;
use Doom::WAD qw/readlump/;

sub parselinedef($) {
	my ($from,$to,$flags,$type,$tag,$rside,$lside) = unpack("vvvvvvv",shift);
	return { from => $from, to => $to, flags => $flags, type => $type, tag => $tag, rside => $rside, lside => $lside };
}

my ($xmin,$ymin,$xmax,$ymax);

sub parsevertex($) {
	my ($x,$y) = unpack("ss",shift);
	$x < $xmin and $xmin = $x;
	$x > $xmax and $xmax = $x;
	$y < $ymin and $ymin = $y;
	$y > $ymax and $ymax = $y;
	return [$x,$y];
}

sub parsenode($) {
	my ($x,$y,$dx,$dy,@lbbox,@rbbox,$left,$right);
	($x,$y,$dx,$dy,@lbbox[0..3],@rbbox[0..3],$left,$right) = unpack("ssssssssssssss",shift);
	return {
		cut => { x => $x, y => $y, dx => $dx, dy => $dy },
		lbbox => \@lbbox, rbbox => \@rbbox,
		left => $left, right => $right,
	};
}

sub readobjects {
	my ($map,$lump,$len,$parser) = @_;
	my $d = readlump("$map/$lump");
	my @l;
	while (length $d > 0) {
		push @l,&$parser(substr $d,0,$len);
		$d = substr $d,$len;
	}
	return \@l;
}

# Recursively turn noeds from an array into a tree
sub treenodesfrom {
	my ($nodearray,$n,$parent) = @_;
	if ($n & 0x8000) { return $n & 0x7fff } # For SSector return just the number
	my $thisnode = $nodearray->[$n];
	$thisnode->{left} = treenodesfrom($nodearray,$thisnode->{left},$thisnode);
	$thisnode->{right} = treenodesfrom($nodearray,$thisnode->{right},$thisnode);
	$thisnode->{parent} = $parent;
	return $thisnode;
}

# Last node is the root
sub treenodes($) {
	my $nodearray = shift;
	return treenodesfrom($nodearray,(@$nodearray - 1));
}

sub new {
	my $type = shift;
	my %level;
	$level{map} = shift || die "not enough params";
	$level{maplump} = readlump($level{map});
	$xmax = $ymax = -32000;
	$xmin = $ymin = +32000;
	$level{vertex} = readobjects($level{map},"VERTEXES",4, \&parsevertex );
	$level{xmax} = $xmax; $level{xmin} = $xmin;
	$level{ymax} = $ymax; $level{ymin} = $ymin;
	$level{linedef} = readobjects($level{map},"LINEDEFS",14, \&parselinedef );
	$level{rootnode} = treenodes(readobjects($level{map},"NODES",28, \&parsenode ));
	return bless \%level,$type;
}

1;

