{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      settings = {
        preset = "modern";
        delay = 500;
        expand = 1;
        notify = false;
        win = {
          border = "single";
          padding = [
            1
            1
          ];
          wo.winblend = 10;
        };
        replace = {
          desc = [
            [
              "<space>"
              "SPACE"
            ]
            [
              "<leader>"
              "SPACE"
            ]
            [
              "<[cC][rR]>"
              "RETURN"
            ]
            [
              "<[tT][aA][bB]>"
              "TAB"
            ]
            [
              "<[bB][sS]>"
              "BACKSPACE"
            ]
          ];
        };
      };
    };
  };
}
