{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = { name = "JetBrainsMono Nerd Font"; size = 14; };
    theme = "Catppuccin-Mocha";  # any installed kitty theme name
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      copy_on_select = "yes";
      disable_ligatures = "always";
      cursor_shape = "beam";
      background_opacity = "0.95";
    };
    keybindings = {
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+w"     = "close_window";
      "ctrl+shift+h"     = "previous_window";
      "ctrl+shift+l"     = "next_window";
    };
  };

  # Optional: make $TERMINAL point to kitty
  home.sessionVariables.TERMINAL = "kitty";
}

