sudo pacman -Syyu
journalctl --vacuum-time=365d
sudo pacman -Rs $(pacman -Qdtq) --noconfirm
sudo pacman -Scc --noconfirm
sudo rm -rf /var/tmp/*
flatpak update --noninteractive
flatpak remove --unused -y
