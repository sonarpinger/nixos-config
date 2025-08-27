{
  programs.nixvim.plugins = {
    startup = {
      enable = true;
      parts = [
        "header"
        "body"
      ];
      sections = {
        header = {
          align = "center";
          content = {
            __raw = "require('startup.headers').hydra_header";
          };
          defaultColor = "";
          foldSection = false;
          highlight = "Statement";
          margin = 5;
          oldfilesAmount = 0;
          title = "Header";
          type = "text";
        };
        body = {
          align = "center";
          content = [
            [
              " Find File"
              "Telescope find_files"
              "<leader>ff"
            ]
            [
              "󰍉 Find Word"
              "Telescope live_grep"
              "<leader>lg"
            ]
            [
              " Recent Files"
              "Telescope oldfiles"
              "<leader>of"
            ]
            [
              " File Browser"
              "Telescope file_browser"
              "<leader>fb"
            ]
            [
              " New File"
              "lua require'startup'.new_file()"
              "<leader>nf"
            ]
          ];
          defaultColor = "";
          foldSection = false;
          highlight = "String";
          margin = 5;
          oldfilesAmount = 0;
          title = "Basic Commands";
          type = "mapping";
        };
      };
    };
  };
}
