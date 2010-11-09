#!/usr/bin/perl -w
# By Colin Phipps; see the file AUTHORS for details
# Copyright 2002 by Colin Phipps
# You are permitted to redistribute this software providing the copyright and
#  authoring notices remain attached - see the file COPYING for details

use strict;

package Doom::WAD;

use Exporter;

use vars qw/@ISA @EXPORT_OK/;
@ISA = qw/Exporter/;
@EXPORT_OK = qw/readlump/;

use vars qw/%lumps/;

sub open ($) {
    open(WAD,shift) or die "Failed to open: $!";
    my $header;
    read(WAD,$header,12) == 12 or die "Failed to read header: $!";
    my ($sig,$lumps,$diroff) = unpack("a4VV",$header);

    seek WAD,$diroff,0 or die "Could not seek to directory: $!";
    my $curlevel;
    while ($lumps--) {
        my $dirent;
        read(WAD,$dirent,16) == 16 or die "Failed to read dir entry: $!";
        my ($pos,$size) = unpack("VV",$dirent);
        my $name = substr $dirent,8; $name =~ s/\0.*//;
        if ($name =~ /^(?:THINGS|VERTEXES|LINEDEFS|SIDEDEFS|SECTORS|SSECTORS|SEGS|NODES|BLOCKMAP|REJECT)$/) {
            $name = "$curlevel/$name";
        } elsif ($name =~ /^(?:MAP\d\d|E\dM\d)$/) {
            $curlevel = $name;
        }
        $lumps{$name} = [ $pos,$size ];
    }
}

sub readlump ($) {
    my $l = shift || die "Must give lump name";
    $l = $lumps{$l} || return undef;;
    seek WAD,$l->[0],0 or return undef;
    my $d;
    read(WAD,$d,$l->[1]) == $l->[1] or return undef;
    return $d;
}

1;

