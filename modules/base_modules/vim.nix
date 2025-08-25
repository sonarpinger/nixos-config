{ pkgs, ... }:
{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      ignorecase = true;
      smartcase = true;
    };

    extraConfig = ''
      syntax on
      set mouse=a
      set clipboard=unnamedplus
      colorscheme desert
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      nerdtree
      vim-airline
    ];
  };
}

