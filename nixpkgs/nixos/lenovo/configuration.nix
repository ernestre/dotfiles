# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Disable suspend on lid close
  # services.logind.lidSwitch = "ignore";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-8f45092d-a0d6-46da-b0c9-75782631f03a".device = "/dev/disk/by-uuid/8f45092d-a0d6-46da-b0c9-75782631f03a";
  boot.initrd.luks.devices."luks-8f45092d-a0d6-46da-b0c9-75782631f03a".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vilnius";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.defaultSession = "gnome-xorg";
  # services.xserver.displayManager.defaultSession = "none+i3";

  services.tailscale.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erre = {
    isNormalUser = true;
    description = "erre";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      brave
      tdesktop
      spotify
      discord
      betaflight-configurator

      gparted
      deluge
      tailscale
      awscli2

      exfat
      gnome.gnome-disk-utility
    ];
  };

  users.defaultUserShell = pkgs.zsh;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "erre";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    playerctl

    autorandr
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };
  programs.zsh.enable = true;
  programs.nm-applet.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  virtualisation.docker.enable = true;

  services.autorandr =
    let
      fingerprint = {
        DP-2 = "00ffffffffffff0010ac7aa0534b50311f17010380342078eaee95a3544c99260f5054a1080081408180a940b300d1c0010101010101283c80a070b023403020360006442100001a000000ff00304646584433375331504b530a000000fc0044454c4c2055323431324d0a20000000fd00323d1e5311000a20202020202000f2";
        eDP-1 = "00ffffffffffff0006af3d5700000000001c0104a51f1178022285a5544d9a270e505400000001010101010101010101010101010101b43780a070383e401010350035ae100000180000000f0000000000000000000000000020000000fe0041554f0a202020202020202020000000fe004231343048414e30352e37200a0070";
      };
    in
    {
      enable = true;

      defaultTarget = "laptop";

      profiles =
        {
          home = {
            inherit fingerprint;

            config = {
              eDP-1. enable = false;
              DP-2 = {
                enable = true;
                crtc = 0;
                primary = true;
                position = "0x0";
                mode = "1920x1200";
                rate = "59.95";
              };
            };
          };

          laptop = {
            inherit fingerprint;

            config = {
              eDP-1 = {
                enable = true;
                crtc = 1;
                primary = true;
                position = "0x0";
                mode = "1920x1080";
                rate = "60.03";
              };
            };
          };
        };
    };
}
