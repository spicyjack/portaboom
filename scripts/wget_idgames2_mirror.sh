#!/bin/sh

FTP_SITE="ftp://ftp.fu-berlin.de/pc/games/idgames2/"
# this changes depending on how many trailing directories we want to cut off
CUT_DIRS=3
LOGFILE="~/bin/wget_idgames2_mirror.log"
MIRROR_DIR=/home/ftp/doom/idgames2_mirror

DATE=$(date --rfc-2822)
echo "=== Starting mirror run: $DATE ===" >> $LOGFILE


/usr/bin/wget \
    --verbose \
    --mirror \
    --wait=4 \
    --random-wait \
    --no-host-directories \
    --cut-dirs=$CUT_DIRS \
    --directory-prefix=$MIRROR_DIR \
    --dot-style=binary $FTP_SITE \
    2>&1 | tee -a $LOGFILE

#FTP_SITE1="ftp://3darchives.in-span.net/pub/idgames" # --cut-dirs=2
#FTP_SITE="ftp://ftp.sunet.se/pub/pc/games/idgames/" # --cut-dirs=4
# -m mirror == infinite recursion, timestamping, don't remove .listing files
