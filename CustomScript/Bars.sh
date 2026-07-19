#!/bin/sh

while true; do
	bat_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
	bat_status=$(cat /sys/class/power_supply/BAT0/status)
	time=$(date "+%d %B %a - %I:%M %p")

	xsetroot -name "$bat_status $bat_percentage% | $time "
	sleep 60
done
