#!/bin/bash

# Search for files in the current directory, try to match the name of each
# file to the filenames in a list of files passed in as $1
for FILE in $(find . | grep zip | sed 's!^\./!!')
do
    if [ $(grep -c $FILE $1) -eq 0 ]; then
        echo "File $FILE *not* in ziplist"
    else
        echo "File $FILE in ziplist"
    fi
done
