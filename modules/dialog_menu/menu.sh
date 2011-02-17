#!/bin/sh

# $Id: menu.sh,v 1.1 2009-07-23 19:04:35 brian Exp $
# Copyright (c)20011 by Brian Manning (brian at portaboom dot com)
# PLEASE DO NOT E-MAIL THE AUTHOR ABOUT THIS SOFTWARE
# The proper venue for questions is the Propaganda mailing list at:
# http://groups.google.com/group/or <psas@groups.google.com>
#
# shell script that presents a menu to the user so they can do stuff

# directory to search for other sub-scripts, or scripts that will be presented
# to the user from this script
SEARCH_DIR=/etc/menuitems

### MAIN SCRIPT ###
# what's my name?
SCRIPTNAME=$(basename $0)

# set quiet mode by default, needs to be set prior to the getops call
QUIET=1

### SCRIPT SETUP ###
TEMP=$(/usr/bin/getopt -o hpqv: \
    --long help,prompt,quiet,verbose: -n '${SCRIPTNAME}' -- "$@")

# if getopts exited with an error code, then exit the script
#if [ $? -ne 0 -o $# -eq 0 ] ; then
if [ $? != 0 ] ; then 
    echo "Run '${SCRIPTNAME} --help' to see script options" >&2 
    exit 1
fi

# Note the quotes around `$TEMP': they are essential!
# read in the $TEMP variable
eval set -- "$TEMP"

# read in command line options and set appropriate environment variables
# if you change the below switches to something else, make sure you change the
# getopts call(s) above
while true ; do
    case "$1" in
        -h|--help) # show the script options
        cat <<-EOF

    ${SCRIPTNAME} [options]

    SCRIPT OPTIONS
    -h|--help       Displays this help message
    -v|--verbose    Nice pretty output messages
    -q|--quiet      No script output (unless an error occurs)
    -p|--prompt     Don't prompt after each output run
    NOTE: Long switches do not work with BSD systems (GNU extension)

EOF
        exit 0;;
        -q|--quiet)    # don't output anything (unless there's an error)
                        QUIET=1
                        shift;;
        -v|--verbose) # output pretty messages
                        QUIET=0
                        shift;;
        -o|--option) # an option
                        OPTION=$2;
                        shift 2;;
        --) shift; break;;
        *) # unknown option
            echo "ERROR: unknown option '${1}';"
            echo "Usage: ${SCRIPTNAME} --help"
            exit 1
            ;;
    esac
done

# from lack_functions.sh
#pause_prompt

#RUNONCE_FILE="/var/run/release_notes.runonce"
# display the release notes/dedication first
#if [ ! -e $RUNONCE_FILE ]; then
#    /bin/sh $SEARCH_DIR/release_notes.sh
#    /bin/date > $RUNONCE_FILE
#fi

# build the list of menu items by grepping out the info from all of the
# menu scripts in $SEARCH_DIR
#OUTPUT_LANG="EN"
#MENUITEMS=$(grep -h DESC-${OUTPUT_LANG} $SEARCH_DIR/* \
#                | grep -v _blank.sh | sort \
#                | sed "s/^# !DESC-..![0-9][0-9]!//" \
#                | sed 's/^\(.*\)!\(.*\)$/"\1" "\2" \\/' )

# from lack_functions.sh
#pause_prompt

### SCRIPT MAIN LOOP ###
#while [ ! -r /tmp/menu.run ]; do
#    SCRIPTOUT=/tmp/dialog.test.sh

MENU_TEXT=$(cat menu.sh)
    # write the script file; this is so all of the shell variables get set
    # and can be displayed to the end user
#    cat > $SCRIPTOUT <<EOSCRIPT
dialog --nocancel  --begin 1 2 \
--title " WELCOME TO PORTABOOM " \
    --yesno "${MENU_TEXT}" \
    22 75
#EOSCRIPT

    #echo "echo \"$SCRIPTNAME exit code was: ${?}\"" >> $SCRIPTOUT
#    echo 'MENU_CHOICE=$(cat /tmp/dialog.exit)' >> $SCRIPTOUT
    #echo 'sleep 1' >> $SCRIPTOUT
#    echo -n "sh ${SEARCH_DIR}/" >> $SCRIPTOUT
#    echo '${MENU_CHOICE}.sh' >> $SCRIPTOUT

    # run the script that was just created
#    sh $SCRIPTOUT
    # now remove it if the exit status was 0
#    if [ $? -eq 0 ]; then
        : #rm $SCRIPTOUT
#    fi
#done # while [ ! -e /tmp/menu.run ]; do

#echo "/tmp/menu.run exists, exiting"
#exit ${EXIT}

### BEGIN LICENCE
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; version 2 dated June, 1991.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program;  if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111, USA.
### END LICENSE

# vi: set filetype=sh shiftwidth=4 tabstop=4:
# конец!
