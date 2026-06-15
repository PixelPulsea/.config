#! /usr/bin/env bash

USERNAME="PixelPulsea"

echo "Is it from your own repos? [y/n]"
read CUSTOM

if [[ $CUSTOM == "y" || $CUSTOM == "" || $CUSTOM == " " ]]; then
	echo "Enter the name of the Github Repo"
	read NAME
	echo "Enter the branch of your repo"
	read BRANCH
	git clone --branch $BRANCH git@github.com:$USERNAME/$NAME.git
	cd $NAME
	direnv allow
elif [[ $CUSTOM == "n" ]]; then
	echo "Enter the name of the repo from the AUR"
	read URL
	git clone https://aur.archlinux.org/$URL.git

	cd $URL
    echo "Do you want to install this? (answer 'n' if you're not on arch) [y/n]"
	read confirmation

	if [[ $confirmation == "y" || $confirmation == "" || $confirmation == " " ]]; then
		echo "===================PKGBUILD==================="
		cat PKGBUILD
		echo "=============================================="
		echo "Final confirmation. Do you want to install this? [y/n]"
		read finalconf

		if [[ $finalconf == "y" || $finalconf == "" || $finalconf == " " ]]; then
			makepkg -sic
		fi
	fi
	
	echo "=============================================="
	echo "Remove the source folder? [y/n]"
	read afterinstall

	if [[ $afterinstall == "y" || $afterinstall == "" || $afterinstall == " " ]]; then
		cd ..
		rm -rf $URL/
		echo -e "\e[32mCompleted!\e[0m"
	else
		echo -e "\e[32mCompleted!\e[0m"
	fi
	
else
	echo "ERROR"
fi
