#!/bin/sh

# script for making an ISO filesystem, for CD burning

# FIXME make a temporary directory and throw everything in there
TEMP_DIR=$(/bin/mktemp -d /tmp/tmp-mkisofs.XXXX)
VERSION="2010.1"
# set an output directory
if [ "x$1" == "x" ]; then
    OUTPUT_DIR=$TEMP_DIR
else
    OUTPUT_DIR=$1
fi
INPUT_DIR=~/src/po
RELEASE_DATE=$(/bin/date "+%d%b%Y-%H.%M.%S")
BANNER="/tmp/vuvuzela.banner.txt"

if [ ! -e $BANNER ]; then
    echo "ERROR: file ${BANNER} not found!"
    exit 1
fi
echo "sedifying $BANNER to $INPUT_DIR/isolinux/banner.txt"
cat $BANNER | sed "{ s!:RELEASE_DATE:!${VERSION} ${RELEASE_DATE}!g; }" \
    > $INPUT_DIR/isolinux/banner.txt

MKISOFS=$(which mkisofs)

# -f follow symlinks
$MKISOFS -f -r -J -v \
-A "LACK - XWindows Version - ${RELEASE_DATE}" \
-publisher "http://code.google.com/p/lack" \
-p "Brian Manning" \
-V "XLACK-$VERSION" \
-c isolinux/boot.cat \
-b isolinux/isolinux.bin \
-no-emul-boot -boot-load-size 4 -boot-info-table \
-o xlack.$VERSION.x86.iso \
$INPUT_DIR
