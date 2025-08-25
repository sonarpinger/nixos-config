{ pkgs, ... }:
{
  services.xserver.desktopManager.xfce.enable = true;

  environment.systemPackages = [ pkgs.kitty ];

  # System default preferred apps for XFCE (exo)
  environment.etc."xdg/xfce4/helpers.rc".text = ''
    TerminalEmulator=kitty
    WebBrowser=firefox
  '';

  # Optional: set a common terminal shortcut at the system level
  # (XFCE keybindings are per-user via xfconf; for a global hint set TERMINAL)
  environment.variables.TERMINAL = "kitty";
}

