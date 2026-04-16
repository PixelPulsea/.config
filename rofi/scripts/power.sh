#!/usr/bin/env bash

# Options
options=" Shutdown\n Reboot\n Sleep\n Logout\n Lock"

# Show Rofi menu
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/Power.rasi)

# Execute choice
case "$chosen" in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Sleep")
        systemctl suspend
        ;;
    " Logout")
        # Replace 'your_session' with your DE/WM logout command
        hyprctl dispatch exit
        # openbox --exit # for Openbox
        # i3-msg exit # for i3
        ;;
    " Lock")
        # Replace with your lock command
        hyprlock
        # betterlockscreen -l dim
        ;;
esac

