#!/usr/bin/env bash

# Options
options=" Shutdown\n Reboot\n Sleep\n Logout\n"

# Show Rofi menu
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/Power.rasi)

# Execute choice
case "$chosen" in
    " Shutdown")
        sudo shutdown
        ;;
    " Reboot")
        sudo reboot
        ;;
    " Sleep")
        systemctl suspend
        ;;
    " Logout")
        # Replace 'your_session' with your DE/WM logout command
		pkill dwm
        ;;
esac

