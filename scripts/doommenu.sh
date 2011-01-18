#!/bin/sh
# $Id: doommenu.sh,v 1.5 2005-12-06 20:27:08 brian Exp $

# TODO
# - add getopts call for parsing iwad base path and paths to doom binaries

: ${DIALOG=dialog}

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$.tmp
trap "rm -f $tempfile" 0 1 2 5 15

CHOICE=$($DIALOG --stdout --clear --title "Choose a Doom Engine..." \
	--menu "Hi, this is a menu for the game 'Doom'.\n\
After you choose a version of the \
Doom Engine to use, a new game will be started \
with that engine.\n\n\
To select a Doom engine to run, \
you can use the UP/DOWN arrow keys, the first \
letter of the choice as a hot key, or the \
number keys 1-9 to choose an option.\n\n\
Try it now!\n\n\
Choose the Doom Engine to run:" 20 51 4 \
"PrBoom"  "Doom clone faithful to the original" \
"Legacy" "Doom clone with many new features")
#"Legacy" "Doom clone with many new features" 2> $tempfile)

retval=$?

#CHOICE=`cat $tempfile`

case $retval in
  0)
    echo "Running '${CHOICE}'";
    case $CHOICE in
        Legacy) cd /opt/doomlegacy-1.42;
            /opt/doomlegacy-1.42/llxdoom \
            -iwad /opt/doomlegacy-1.42/doom1.wad;;
        PrBoom) /usr/games/prboom -nofullscreen \
            -iwad /opt/doomlegacy-1.42/doom1.wad;;
    esac;;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
