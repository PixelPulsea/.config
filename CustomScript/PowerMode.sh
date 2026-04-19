#! /usr/bin/env bash

STAT=$(cat /sys/class/power_supply/ADP1/online)
PREV=""

while true; do
	STAT=$(cat /sys/class/power_supply/ADP1/online)
	if [[ "$STAT" != "$PREV" ]]; then
		PREV="$STAT"
		if [[ "$STAT" == "1" ]]; then
			notify-send "Charging: Performance Mode Enabled"
			powerprofilesctl set performance
			brightnessctl s 95%
		else
			notify-send "Discharging: Power Saver Mode Enabled"
			powerprofilesctl set power-saver
			brightnessctl s 50%
		fi
	fi
	sleep 2
done
