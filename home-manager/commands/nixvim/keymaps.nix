{
  programs.nixvim = {
    keymaps = [
      {
        action = ":q<CR>";
        key = "<leader>q";
        options = {
          silent = true;
          noremap = true;
          desc = "Quit";
        };
      }
      {
        action = ":w<CR>";
        key = "<leader>w";
        options = {
          silent = true;
          noremap = true;
          desc = "Save";
        };
      }
      {
        action = ":wq<CR>";
        key = "<leader>wq";
        options = {
          silent = true;
          noremap = true;
          desc = "Save and quit";
        };
      }
      {
        action = "<C-\\><C-n>:ToggleTerm direction=float<CR>";
        key = "<leader>t";
        mode = [
          "n"
          "v"
          "t"
        ];
        options = {
          silent = true;
          noremap = true;
          desc = "Toggle floating terminal";
        };
      }
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>lg";
        options = {
          silent = true;
          noremap = true;
          desc = "Live grep";
        };
      }
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "Find file";
        };
      }
      {
        action = ":Telescope oldfiles<CR>";
        key = "<leader>of";
        options = {
          silent = true;
          noremap = true;
          desc = "Browse recent files";
        };
      }
      {
        action = ":Telescope file_browser<CR>";
        key = "<leader>fb";
        options = {
          silent = true;
          noremap = true;
          desc = "Directory-based file browser";
        };
      }
      {
        action = ":Neotree toggle reveal<CR>";
        key = "<leader>nt";
        options = {
          silent = true;
          noremap = true;
          desc = "Toggle file tree";
        };
      }
      {
        action = ":Neotree focus<CR>";
        key = "<leader>nf";
        options = {
          silent = true;
          noremap = true;
          desc = "Toggle file tree focus";
        };
      }
      {
        action = ":Glance definitions<CR>";
        key = "<leader>gd";
        options = {
          silent = true;
          noremap = true;
          desc = "Glance definitions";
        };
      }
      {
        action = ":Glance references<CR>";
        key = "<leader>gr";
        options = {
          silent = true;
          noremap = true;
          desc = "Glance references";
        };
      }
      {
        action = "\"+y<CR>";
        key = "<leader>y";
        mode = [ "v" ];
        options = {
          silent = true;
          noremap = true;
          desc = "Glance references";
        };
      }
    ];
  };
}
