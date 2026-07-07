#! /usr/bin/env bash

USERNAME="PixelPulsea"

read -p "Is it from your own repos? [y/n]: " CUSTOM

if [[ $CUSTOM == "y" || $CUSTOM == "" || $CUSTOM == " " ]]; then
	read -p "Enter the name of the Github Repo: " NAME
    read -p  "Enter the branch of your repo: " BRANCH
	git clone --branch $BRANCH git@github.com:$USERNAME/$NAME.git
	cd $NAME
	direnv allow
elif [[ $CUSTOM == "n" ]]; then
	read -p "Enter the name of the repo: " URL
	read -p "Is it from AUR? [y/n]: " SOURCE
	
	if [[ $SOURCE == "y" ]]; then
		git clone https://aur.archlinux.org/$URL.git
		cd $URL
		read -p "Do you want to install this? (answer 'n' if you're not on arch) [y/n]: " confirmation

		if [[ $confirmation == "y" || $confirmation == "" || $confirmation == " " ]]; then
			echo "===================PKGBUILD==================="
			cat PKGBUILD
			echo "=============================================="
			read -p "Final confirmation. Do you want to install this? [y/n]: " finalconf
			
			if [[ $finalconf == "y" || $finalconf == "" || $finalconf == " " ]]; then
				makepkg -sic -r
			fi
		fi
		
		echo "=============================================="
		read -p "Remove the source folder? [y/n]: " afterinstall

		if [[ $afterinstall == "y" || $afterinstall == "" || $afterinstall == " " ]]; then
			cd ..
			rm -rf $URL/
			echo -e "\e[32mCompleted!\e[0m"
		else
			echo -e "\e[32mCompleted!\e[0m"
		fi
	elif [[ $SOURCE == "n" ]]; then
		read -p "Enter the username: " USER
		read -p "Clone with commit/push? [y/n]: " project
	    branch="main"
		read -p "Which branch? [press Enter if main]: " branch

		if [[ $project == "y" ]]; then
			git clone git@github.com:$USER/$URL.git
		elif [[ $project == "n" ]]; then
			git clone --branch $branch https://github.com/$USER/$URL
			echo -e "\e[32mDone!\e[0m"
		fi
	fi
			 
else
	echo "ERROR"
fi
