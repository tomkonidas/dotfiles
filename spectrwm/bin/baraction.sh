#!/bin/bash
# baraction.sh for spectrwm status bar

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
    vol_state=$(amixer get Master | awk -v val1=$6 -F'[][]' 'END{print $6}')
    vol=$(amixer get Master | awk -F'[][]' 'END{ print $2}')
    [ "$vol_state" = "off" ] && vol="OFF"
    echo -e "VOL: $vol"
}

## Bat
bat() {
	
# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity) || break
	status=$(sed "s/Discharging/D/;s/Not charging/N/;s/Charging/C/;s/Unknown/U/;s/Full/F/" "$battery"/status)

	# If it is discharging and 25% or less, we will add a ! as a warning.
	 [ "$capacity" -le 25 ] && [ "$status" = "D" ] && warn="!"

	printf "%s%s%s%% " "$status" "$warn" "$capacity"
	unset warn
done | sed 's/ *$//'
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

while :; do
	echo "+@fg=2; $(cpu) +@fg=0; | +@fg=3; $(mem) +@fg=0; | +@fg=4; $(bat) +@fg=0; | +@fg=5; $(vol) +@fg=0; |"
	sleep $SLEEP_SEC
done
