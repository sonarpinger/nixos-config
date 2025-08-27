{
  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;

    colorschemes.onedark = {
      enable = true;
      settings = {
        style="dark";
	transparent = true;
      };
    };

    opts = {
      number = true;
      relativenumber = false;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    diagnostic.settings = {
      virtual_text = true;
      update_in_insert = true;
      severity_sort = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard.providers.wl-copy.enable = true;
  };
}
