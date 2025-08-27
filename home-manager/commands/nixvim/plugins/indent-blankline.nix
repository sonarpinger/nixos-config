{
  programs.nixvim.plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        scope = {
          show_end = true;
          show_exact_scope = true;
          show_start = true;
        };
      };
    };
  };
}
