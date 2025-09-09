{ config, configPath, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      shellAliases = {
        grep = "grep --color=auto";
        open = "xdg-open";
        t = "tmux";
        td = "tmux detach";
        nvimf = "nvim $(fzf --preview='bat {}')";
        rebuild = "sudo nixos-rebuild switch --flake ${configPath}#$(uname -n)";
      };

      initContent = ''
        bindkey '^F' forward-word
        bindkey '^B' backward-word
      '';

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
        plugins = [
          "tmux"
          "firewalld"
          "tailscale"
        ];
      };
    };
  };
}
