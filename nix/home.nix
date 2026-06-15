{ config, pkgs, ... }:

{
	home.username = "achka";
	home.homeDirectory = "/home/achka";
	home.stateVersion = "26.05";

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo Fuck you";
			import = "/home/me/.config/CustomScript/GitCloning.sh";
			localssh = "/home/me/.config/CustomScript/localSSH.sh";
		};
	};

	programs.git = {
		enable = true;
		userEmail = "achka.bt@gmail.com";
		userName = "PixelPulsea";
	};

	home.packages = with pkgs; [
		picom
		direnv
		starship
		wget
		dmenu
		brave
		emacs
		thunar
		alacritty
		brave
		wget
		dmenu
	];
}
