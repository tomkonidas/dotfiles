#!/bin/bash

# This script is meant to rename each file in a directory
# with it's parent's directory's name.

DIRS=$(ls -d */)

for DIR in $DIRS
do
  cd $DIR
  for FILE in $(ls)
  do
    if [ -f $FILE ]
    then
      echo $FILE
    fi
  done
  cd ..
done

