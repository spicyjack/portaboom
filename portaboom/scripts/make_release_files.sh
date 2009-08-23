#!/bin/sh

# script to create the release files for XXXX release;
# script will be run from the top level project directory

# program locations
CAT=$(which cat)
SED=$(which sed)

OUTPUT_DIR="/tmp"
INPUT_DIR="etcfiles"
HOSTNAME="portaboom"
INPUT_FILES="issue.${HOSTNAME}"
# any files in this list get enumerated over and the substitutions below are
# performed on them

### create the initramfs filelist
if [ -e $PROJECT_DIR/kernel_configs/linux-image-$1.txt ]; then
    cat $PROJECT_DIR/${HOSTNAME}_base.txt \
        $PROJECT_DIR/kernel_configs/linux-image-$1.txt \
        > $PROJECT_DIR/initramfs-filelist.txt
else
    echo "make_release_files.sh: linux-image-$1.txt file does not exist"
    echo "make_release_files.sh: in ${PROJECT_DIR}/kernel_configs directory"
    exit 1
fi

### create the hostname file
echo "${HOSTNAME}" > $OUTPUT_DIR/hostname.${HOSTNAME}

### create the issue file
source $PROJECT_DIR/release_info.cfg

# now build the file with the correct substitutions performed
for SEDFILE in $(echo $INPUT_FILES);
do
    $CAT $PROJECT_DIR/etcfiles/$SEDFILE \
        | $SED "{s!:RELEASE_VER:!${RELEASE_VER}!g;
            s!:DEMO_PASS:!${DEMO_PASS}!g;
            }" \
    > $OUTPUT_DIR/$SEDFILE
done

# vi: set sw=4 ts=4 paste:
