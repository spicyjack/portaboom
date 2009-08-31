#!/usr/bin/perl -w

# Quick Gtk2-Perl demo script
# Copyright (c) 2008 Brian Manning <elspicyjack at gmail dot com>
# Used ideas from the following webpages:
# http://forgeftp.novell.com//gtk2-perl-study/documentation/html/c1091.html
# and probably others

use strict;
use warnings;
use utf8;
# import the TRUE/FALSE constants from Glib prior to loading Gtk2
use Glib qw(TRUE FALSE);
# Gtk2->init; works if you don't use -init on use
use Gtk2 -init;

# create the window


# create a VBox to hold a label and a button
my $vbox = Gtk2::VBox->new(FALSE, 5);

# create a label with some text
my $label_text = "Hello world!\n";
$label_text .= "Здравствуйте!\n";
my $label = Gtk2::Label->new($label_text);
# pack the label, expand == true, fill == true, 5 pixels padding
$vbox->pack_start($label, TRUE, TRUE, 5);

# create a 'quit' button
my $button = Gtk2::Button->new (q|Quit (Restarts XWindows)|);
# connect the button's 'click' signal to an action
$button->signal_connect (clicked => sub { Gtk2->main_quit });
# pack the button, expand == false, fill == FALSE, 5 pixels padding
$vbox->pack_start($button, FALSE, FALSE, 5);

# create the mainwindow
my $window = Gtk2::Window->new (q(toplevel));
# add the vbox
$window->add($vbox);
# center the window
$window->set_position(q(center));
# show the window
$window->show_all;
# yield to Gtk2 and wait for user input
Gtk2->main;
