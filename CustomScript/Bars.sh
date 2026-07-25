#!/bin/sh

while true; do
	time=$(date "+%d %B %a - %I:%M %p")
	bat=$(ls /sys/class/power_supply/)
	
	if [[ $bat == "" ]]; then
		xsetroot -name " $time "
	else
        read -r bat_percentage < /sys/class/power_supply/BAT0/capacity
        read -r bat_status < /sys/class/power_supply/BAT0/status
		xsetroot -name "$bat_status $bat_percentage% | $time "
	fi
	
	sleep 60
done
