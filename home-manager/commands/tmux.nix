{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      mouse = true;
      baseIndex = 1;
      keyMode = "vi";
      historyLimit = 5000;
      terminal = "xterm-256-color";
      disableConfirmationPrompt = true;
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.tilish
        tmuxPlugins.resurrect
        tmuxPlugins.gruvbox
        tmuxPlugins.continuum
        tmuxPlugins.prefix-highlight
      ];
      extraConfig = "bind C-l send-keys 'C-l'";
    };
  };
}
