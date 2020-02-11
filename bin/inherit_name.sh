#!/bin/bash

dir() {
  cd $1
    for FILE in $(ls); do
      if [ -d $FILE ]; then
        $(dir $FILE )
      elif [ -f $FILE ]; then
        echo $FILE
      fi
    done
  cd ..
}

DIRS=$(ls -d */)

for DIR in $DIRS; do
  dir $DIR
done

