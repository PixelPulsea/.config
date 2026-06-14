{ config, pkgs, ... }:

{
	system.nixos.label = "-";

	services.power-profiles-daemon.enable = true;
	services.displayManager.ly.enable = true;
	services.gvfs.enable = true;
	services.udisks2.enable = true;

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
		config = { common.default = "*"; };
	};

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [ vpl-gpu-rt ];
	};

	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
	};

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	services.flatpak.enable = true;

	services.pipewire = {
		enable = true;
		pulse.enable = true; # For PulseAudio compatibility
			alsa.enable = true;
		jack.enable = true;
	};

	services.logind.settings.Login.HandleLidSwitch = "suspend";
	services.logind.settings.Login.HandleLidSwitchExternalPower = "suspend";

	environment.etc."inputrc".text = ''
		set bell-style none
		'';

	imports =
		[  
		./hardware-configuration.nix
		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.configurationLimit = 5;

	boot.kernelParams = [ 	
		"mem_sleep_default=deep" 
		"quiet" 
		"splash" 
		"boot.shell_on_fail" 
		"loglevel=3" 
		"rd.systemd.show_status=false" 
		"rd.udev.log_level=3" 
		"udev.log_priority=3"
	];

	boot.initrd.verbose = false;

	networking.hostName = "nixos";
	networking.wireless.enable = true;  

	networking.networkmanager.enable = true;

	time.timeZone = "Asia/Ulaanbaatar";

	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "mn_MN";
		LC_IDENTIFICATION = "mn_MN";
		LC_MEASUREMENT = "mn_MN";
		LC_MONETARY = "mn_MN";
		LC_NAME = "mn_MN";
		LC_NUMERIC = "mn_MN";
		LC_PAPER = "mn_MN";
		LC_TELEPHONE = "mn_MN";
		LC_TIME = "en_US.UTF-8";
	};

# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.achka = {
		isNormalUser = true;
		description = "achka";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	services.xserver.excludePackages = [ pkgs.xterm ];

	services.xserver = { 
		enable = true;

		desktopManager = { xterm.enable = false; };

		windowManager.i3 = {
			enable = true;
			extraPackages = with pkgs; [ dmenu i3status i3blocks ]; 
		};
	};

services.displayManager.defaultSession = "none+i3";
programs.i3lock.enable = true;

	environment.systemPackages = with pkgs; [
#essentials
		usbutils
			nautilus  
			alacritty
			brightnessctl
			pavucontrol

#apps
			dropbox
			tmux
			onlyoffice-desktopeditors
			kdePackages.okular
			image-roll
			emacs

#appearance/usability
			copyq
			rofi
			nwg-look
			papirus-icon-theme
			dunst

#other essentials (for me)
			git
			python3
			gcc
			ani-cli
			bc
			openjdk21
			btop
			playerctl
			entr
			bear
			ripgrep
			libgccjit
			nasm
			gnumake
			qemu
			mtools
			hexedit
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#  wget
			];

	fonts = {
		enableDefaultPackages = true;
		packages = with pkgs; [
			noto-fonts
				noto-fonts-cjk-sans
				noto-fonts-color-emoji
				liberation_ttf
				fira-code
				fira-code-symbols
				nerd-fonts.fira-code
				nerd-fonts.jetbrains-mono
		];
	};

	fonts.fontconfig.useEmbeddedBitmaps = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
	networking.firewall.allowedTCPPorts = [ 22 80 443 17500 4747 ];
	networking.firewall.allowedUDPPorts = [ 53 17500 4747 ];
# Or disable the firewall altogether.
	networking.firewall.enable = true;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

}
