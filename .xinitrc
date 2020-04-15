#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#wal -n -R
feh --bg-scale --randomize ~/Pictures/wallpapers/* &
picom &
dunst > /dev/null 2>&1 &

while true; do
  /usr/bin/spectrwm 2> /dev/null
done
#exec spectrwm
