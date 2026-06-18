#!/bin/sh

user=$(whoami)

while true; do
	#main variables
	bat_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
	bat_status=$(cat /sys/class/power_supply/BAT0/status)
	time=$(date "+%H:%M %P")

	ram_total=$(grep 'MemTotal' /proc/meminfo | awk '{print $2}')
	ram_free=$(grep 'MemAvailable' /proc/meminfo | awk '{print $2}')
	ram_used=$(((ram_total - ram_free) / 1024))
	ram_total=$((ram_total / 1024))

	xsetroot -name " $ram_used MB / $ram_total MB | $bat_status $bat_percentage% | $time | $user "
	sleep 1
done
