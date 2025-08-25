{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

   #  promptInit = '' 
   #    # simple theme
   #    autoload -U promptinit
   #    promptinit
   #    prompt fade
   #  '';

    interactiveShellInit = ''
      alias ll="ls -alF"
      alias gs="git status"

      # manually source oh-my-zsh if you want it system-wide
      if [ -d ${pkgs.oh-my-zsh}/share/oh-my-zsh ]; then
        ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
        source $ZSH/oh-my-zsh.sh
        ZSH_THEME="gentoo"
        plugins=(git docker sudo)
      fi
    '';
  };

  users.users.root.shell = pkgs.zsh;
  users.defaultUserShell = pkgs.zsh;
}
