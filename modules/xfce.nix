{ pkgs, ... }:
{
  imports = [
    ./xfce_modules/default.nix
    ./xfce_modules/kitty-setup.nix
  ];
}

