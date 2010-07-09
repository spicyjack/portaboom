#!/bin/sh

# script to start X as user 'lack', with some extra housekeeping stuff

HOME_DIR="/home/lack"
STARTX="/usr/bin/startx"

# see if we even want to run X
if [ $(/bin/grep -c nox /proc/cmdline) -eq 0 ]; then
    # yep, run X; now do we want a normal or debug session?
    # check for either debugging or explicit xterm call
    if [ $(/bin/egrep -c "wm=[DEBUG|xterm]" /proc/cmdline) -gt 0 ]; then
        # debug session
        cat $HOME_DIR/xsession | sed "s/^#\(exec xterm.*\)$/\1/" \
            > $HOME_DIR/.xsession
    elif [ $(/bin/egrep -c "wm=flwm" /proc/cmdline) -gt 0 ]; then
        # run flwm
        cat $HOME_DIR/xsession | sed "s/^#\(exec flwm.*\)$/\1/" \
            > $HOME_DIR/.xsession
    elif [ $(/bin/egrep -c "wm=windowlab" /proc/cmdline) -gt 0 ]; then
        # run flwm
        cat $HOME_DIR/xsession | sed "s/^#\(exec windowlab.*\)$/\1/" \
            > $HOME_DIR/.xsession
    else
        # normal session with the Gtk2-Perl script greeter
        cat $HOME_DIR/xsession | sed "s/^#\(exec perl.*\)$/\1/" \
            > $HOME_DIR/.xsession
    fi
    # set the xsession file to be executable
    #chmod 755 $HOME_DIR/.xsession
    # start X as the lack user
    /bin/su -s /bin/sh -c "$STARTX" lack
else
    # nope, don't run x; just sleep for a day, as /sbin/init will keep
    # restarting this script if it exits
    sleep 86400
fi

exit 0
