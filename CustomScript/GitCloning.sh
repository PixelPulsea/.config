#! /usr/bin/env bash

USERNAME="PixelPulsea"

echo "Is it from your own repos? [y/n]"
read CUSTOM

if [[ $CUSTOM == "y" ]]; then
	echo "Enter the name of the Github Repo"
	read NAME
	git clone git@github.com:$USERNAME/$NAME.git
	cd $NAME
	direnv allow
elif [[ $CUSTOM == "n" ]]; then
	echo "Enter the name of the repo from the AUR"
	read URL
	git clone https://aur.archlinux.org/$URL.git

	cd $URL
	echo "Do you want to install this? [y/n]"
	read confirmation

	if [[ $confirmation == "y" ]]; then
		echo "===================PKGBUILD==================="
		cat PKGBUILD
		echo "=============================================="
		echo "Final confirmation. Do you want to install this? [y/n]"
		read finalconf

		if [[ $finalconf == "y" ]]; then
			makepkg -sic
			
			echo "=============================================="
			echo "Remove the source folder? [y/n]"
			read afterinstall

			if [[ $afterinstall == "y" || $afterinstall == "" || $afterinstall == " " ]]; then
				cd ..
				rm -rf $URL/
				echo -e "\e[34mInstall Completed!\e[0m"
			else
				echo -e "\e[34mInstall Completed!\e[0m"
			fi
		else
			echo "Install Aborted"
		fi
	else
		echo "Install Aborted"
	fi
else
	echo "ERROR"
fi
