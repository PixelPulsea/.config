#!/bin/sh

user=$(whoami)

while true; do
	#main variables
	bat_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
	bat_status=$(cat /sys/class/power_supply/BAT0/status)
	time=$(date "+%H:%M")

	ram_total=$(grep 'MemTotal' /proc/meminfo | awk '{print $2}')
	ram_free=$(grep 'MemAvailable' /proc/meminfo | awk '{print $2}')
	ram_used=$(((ram_total - ram_free) / 1024))
	ram_total=$((ram_total / 1024))

	cpu1=$(cat /sys/class/thermal/thermal_zone1/temp)
	cpu2=$(cat /sys/class/thermal/thermal_zone2/temp)
	cpu3=$(cat /sys/class/thermal/thermal_zone3/temp)
	cpu4=$(cat /sys/class/thermal/thermal_zone4/temp)
	cpu5=$(cat /sys/class/thermal/thermal_zone5/temp)
	cpu6=$(cat /sys/class/thermal/thermal_zone6/temp)
	cpu7=$(cat /sys/class/thermal/thermal_zone7/temp)
	cpu8=$(cat /sys/class/thermal/thermal_zone8/temp)
	cpu9=$(cat /sys/class/thermal/thermal_zone9/temp)
	cpu10=$(cat /sys/class/thermal/thermal_zone10/temp)
	cpu11=$(cat /sys/class/thermal/thermal_zone11/temp)

	average_cpu_temp=$(((((cpu1+cpu2+cpu3+cpu4+cpu5+cpu6+cpu7+cpu8+cpu9+cpu10+cpu11)) / 11) / 1000))

	xsetroot -name " $ram_used MB / $ram_total MB | Temp: $average_cpu_temp | $bat_status $bat_percentage% | $time | $user "
	sleep 1
done
