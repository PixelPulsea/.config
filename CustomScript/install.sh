#! /usr/bin/env bash

echo "What gpu are you running? (intel or press enter for nvidia)"
read GPU
if [[ "$GPU" == "intel" ]]; then
	sudo pacman -S --noconfirm flatpak alsa-utils blueman bluez-utils pipewire emacs blueman x11 xorg i3 alacritty
	sudo rm -rf .config
	git clone https://github.com/PixelPulsea/.config
	reboot
else
	sudo pacman -S --noconfirm nvidia 
fi
