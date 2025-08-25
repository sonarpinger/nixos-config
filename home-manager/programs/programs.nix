{ pkgs, ... }:

{
  imports = [
    # ./firefox.nix
    ./kitty.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    remmina
    vlc
    wireshark
    zoom-us
    vesktop
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
  };
}
