{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./zsh-root.nix
  ];

  environment.systemPackages = with pkgs; [
    git vim htop wget ripgrep networkmanagerapplet jq
  ];

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Nix optimizations
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
    options = "--delete-older-than 30d";
  };

  programs.nix-ld.enable = true;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.printing.enable = true;
  programs.zsh.enable = true;

  home-manager.sharedModules = [
    ./tmux.nix
    ./vim.nix
  ];
}

