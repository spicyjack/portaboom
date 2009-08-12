#!/usr/bin/perl -w

use strict;
# Gtk2->init; works if you don't use -init on use
use Gtk2 -init;

# create the window
my $window = Gtk2::Window->new (q(toplevel));
# create the button
my $button = Gtk2::Button->new (q(Quit));
# connect the button's 'click' signal to an action
$button->signal_connect (clicked => sub { Gtk2->main_quit });
# add the button to the window
$window->add ($button);
# show the window
$window->show_all;
# yield to Gtk2 and wait for user input
Gtk2->main;
