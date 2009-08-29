#!/bin/sh

# script to start X as user 'demo', with some extra housekeeping stuff

DEMO_HOME="/home/demo"
STARTX="/usr/bin/startx"

if [ $(/bin/grep -c DEBUG /proc/cmdline) -gt 0 ]; then
    cat /home/demo/xsession | sed "s/^#(exec xterm.*)$/\1/" \
        > $DEMO_HOME/.xsession
else
    cat /home/demo/xsession | sed "s/^#(exec perl.*)$/\1/" \
        > $DEMO_HOME/.xsession
fi
/bin/su -s /bin/sh -c "$STARTX" demo

