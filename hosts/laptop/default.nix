{ config, pkgs, pkgs-unstable, inputs, username, user, configPath, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/xfce.nix
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
  
  security.sudo.extraConfig = ''
    %wheel ALL=(ALL) NOPASSWD: ALL
  '';

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
