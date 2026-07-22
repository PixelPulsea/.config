#!/bin/sh
(exec /home/achka/.config/CustomScript/Bars.sh) &
(exec /home/achka/.config/CustomScript/PowerMode.sh) &
(exec feh --bg-fill /home/achka/Pictures/SpaceMoon.jpg) &
xset dpms 600 &
xss-lock -- slock &
copyq --start-server &
dropbox &
picom &

exec dwm
