#!/bin/sh
# ~/.xsession

(exec /home/achka/.config/CustomScript/Bars.sh) &
(exec /home/achka/.config/CustomScript/PowerMode.sh) &
picom &
emacs &
brave &

exec dwm

