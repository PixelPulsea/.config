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

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	services.flatpak.enable = true;

	services.pipewire = {
		enable = true;
		pulse.enable = true;
		alsa.enable = true;
		jack.enable = true;
	};

	services.logind.settings.Login.HandleLidSwitch = "suspend";
	services.logind.settings.Login.HandleLidSwitchExternalPower = "suspend";

	environment.etc."inputrc".text = '' set bell-style none '';
	
	imports = [ ./hardware-configuration.nix ];

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

	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	users.users.achka = {
		isNormalUser = true;
		description = "achka";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

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
		lxappearance
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
		picom
		entr
		bear
		ripgrep
		libgccjit
		gnumake
		qemu
		mtools
		hexedit
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
				nerd-fonts.iosevka
		];
	};

	fonts.fontconfig.useEmbeddedBitmaps = true;

  	services.openssh.enable = true;

	networking.firewall.allowedTCPPorts = [ 22 80 443 17500 4747 ];
	networking.firewall.allowedUDPPorts = [ 53 17500 4747 ];
	networking.firewall.enable = true;

	system.stateVersion = "25.11";

}
