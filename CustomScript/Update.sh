echo "If NixOS write nix, if Arch write arch"
read distro

if [[ $distro == "arch" ]]; then
	sudo pacman -Syyu --noconfirm

	journalctl --vacuum-time=365d

	sudo pacman -Rs $(pacman -Qdtq) --noconfirm
	sudo pacman -Scc --noconfirm
	sudo rm -rf /var/tmp/*

	flatpak update --noninteractive
	flatpak remove --unused -y
elif [[ $distro == "nix" ]]; then
	sudo nixos-rebuild switch --flake ~/.nix#Snixxy
fi
