#!/bin/sh

FTP_SITE="ftp://ftp.fu-berlin.de/pc/games/idgames/" # --cut-dirs=3
# this changes depending on how many trailing directories we want to cut off
CUT_DIRS=3
LOGFILE="~/bin/wget_idgames_mirror.log"
MIRROR_DIR="/home/ftp/doom/idgames_mirror"

/usr/bin/wget \
    --verbose \
    --mirror \
    --wait=2 \
    --random-wait \
    --no-host-directories \
    --cut-dirs=$CUT_DIRS \
    --directory-prefix=$MIRROR_DIR \
    --dot-style=binary $FTP_SITE \
    2>&1 | tee -a $LOGFILE

#FTP_SITE="ftp://3darchives.in-span.net/pub/idgames" # --cut-dirs=2
#FTP_SITE="ftp://ftp.sunet.se/pub/pc/games/idgames/" # --cut-dirs=4
# -m mirror == infinite recursion, timestamping, don't remove .listing files
# --wait and --random-wait randomize the wait interval
