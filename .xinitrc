#!/bin/sh
# ~/.xsession

exec /home/$(whoami)/.config/CustomScript/Bars.sh &
exec feh --bg-fill /home/$(whoami)/Pictures/PurpleAccentMountains.png &
gentoo-pipewire-launcher &
copyq --start-server &
picom &

exec dwm

