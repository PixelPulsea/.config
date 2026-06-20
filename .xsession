#!/bin/sh
# ~/.xsession

(exec /home/achka/.config/CustomScript/Bars.sh) &
(exec /home/achka/.config/CustomScript/PowerMode.sh) &
(exec feh --bg-fill /home/achka/Pictures/rock.jpg) &
copyq --start-server &
picom &
emacs &
brave &

exec dwm

