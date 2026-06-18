#!/bin/sh
# ~/.xsession

(exec /home/achka/.config/CustomScript/Bars.sh) &
(exec /home/achka/.config/CustomScript/PowerMode.sh) &
(exec feh --bg-fill ~/Pictures/SpaceMoon.png) &
picom &
emacs &
copyq &
brave &

exec dwm

