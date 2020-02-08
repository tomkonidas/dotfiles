#!/bin/bash

# This script is meant to rename each file in a directory
# with it's parent's directory's name.

dir() {
  cd $1
    for FILE in $(ls)
    do
      if [ -d $FILE ]
      then
        $(dir $FILE )
      elif [ -f $FILE ]
      then
        echo $FILE
      fi
    done
  cd ..
}

DIRS=$(ls -d */)

for DIR in $DIRS
do
  dir $DIR
done

