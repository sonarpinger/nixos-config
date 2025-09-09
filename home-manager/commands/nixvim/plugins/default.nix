{
  imports = [
    ./blink-cmp.nix
    ./blink-cmp-copilot.nix
    ./copilot.nix
    ./glance.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./startup.nix
    ./telescope.nix
    ./which-key.nix
  ];

  programs.nixvim.plugins = {
    blink-ripgrep.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp.enable = true;
    cmp_luasnip.enable = true;
    colorizer.enable = true;
    comment.enable = true;
    diffview.enable = true;
    direnv.enable = true;
    gitblame.enable = true;
    gitsigns.enable = true;
    intellitab.enable = true;
    lastplace.enable = true;
    lsp-format.enable = true;
    lsp-lines.enable = true;
    lsp-signature.enable = true;
    lualine.enable = true;
    luasnip.enable = true;
    markview.enable = true;
    multicursors.enable = true;
    neo-tree.enable = true;
    neoscroll.enable = true;
    nvim-autopairs.enable = true;
    refactoring.enable = true;
    toggleterm.enable = true;
    treesitter.enable = true;
    web-devicons.enable = true;
  };
}
