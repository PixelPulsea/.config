{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	networking.hostName = "Snixxy";
	networking.networkmanager.enable = true;

	time.timeZone = "Asia/Ulaanbaatar";

	services.xserver = {
		enable = true;
		windowManager.dwm.enable = true;
	};
	services.displayManager.ly.enable = true;

	users.users.achka = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
	};

	environment.systemPackages = with pkgs; [ vim git ];

	fonts.packages = with pkgs; [
		liberation_ttf
		nerd-fonts.jetbrains-mono
		nerd-fonts.iosevka
		nerd-fonts.fira-code
		nerd-fonts.code-new-roman
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "26.05";
}

