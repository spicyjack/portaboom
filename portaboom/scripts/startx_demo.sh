#!/bin/sh

# script to start X as user 'demo', with some extra housekeeping stuff

HOME_DIR="/home/demo"
STARTX="/usr/bin/startx"

if [ $(/bin/grep -c DEBUG /proc/cmdline) -gt 0 ]; then
    cat /home/demo/xsession | sed "s/^#\(exec xterm.*\)$/\1/" \
        > $HOME_DIR/.xsession
else
    cat /home/demo/xsession | sed "s/^#\(exec perl.*\)$/\1/" \
        > $HOME_DIR/.xsession
fi
# set the xsession file to be executable
#chmod 755 $HOME_DIR/.xsession
/bin/su -s /bin/sh -c "$STARTX" demo

