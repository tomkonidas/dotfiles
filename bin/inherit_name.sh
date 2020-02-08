#!/bin/bash

# This script is meant to rename each file in a directory
# with it's parent's directory's name.

DIRS=$(ls -d */)

for DIR in $DIRS
do
  dir($DIR)
done

dir(CUR)
do
  cd $CUR
    for FILE in $(ls)
    do
      if [ -d $CUR ]
      then
        $(dir($CUR))
      elif [ -f $FILE ]
        echo $FILE
      fi
    done
  cd ..
done
