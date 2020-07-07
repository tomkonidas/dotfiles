[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

~/.fehbg
picom -CGb
dunst > /dev/null 2>&1 &

exec spectrwm
