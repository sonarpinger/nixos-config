{ config, pkgs, pkgs-unstable, inputs, username, user, configPath, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
  ];

  networking.hostName = "laptop";
  time.timeZone = "America/Los_Angeles";

  users.users.${username}= {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];   
  };

  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        username
        user
        configPath
        pkgs-unstable
        ;
    };
    users = {
      ${username} = import ../../home-manager/default.nix;
    };
    backupFileExtension = "backup";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  services.tailscale.enable = true;
  virtualisation.docker.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ username ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable all firmware
  hardware.enableAllFirmware = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.fuse.userAllowOther = true;
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ username ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  system.stateVersion = "25.05";
}
