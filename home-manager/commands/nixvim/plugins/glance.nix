{
  programs.nixvim.plugins = {
    glance = {
      enable = true;
      settings = {
        border.enable = true;
        theme.mode = "darken";
      };
    };
  };
}
