echo "Would you like to connect to a GUI interface? [y/n]"
read choice

if [[ $choice == "y" || $choice == "Y" || $choice == " " || $choice == "" ]]; then
	echo "Connecting with GUI..."
	sleep 1
	sudo xfreerdp3 /v:100.73.144.62 /u:user /p:12894578 /dynamic-resolution
else
	echo "Connecting..."
	sleep 1
	ssh user@100.73.144.62
fi
