#!/bin/sh

# script to start X as user 'demo', with some extra housekeeping stuff

SU_USER="demo"
STARTX="/usr/bin/startx"

/bin/su -s /bin/sh -c "$STARTX" demo

