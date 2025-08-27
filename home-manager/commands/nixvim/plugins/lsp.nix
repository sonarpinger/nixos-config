{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        nil_ls.enable = true;
        nixd = {
          enable = true;
          extraOptions = {
            offset_encoding = "utf-8";
          };
        };
        html.enable = true;
        ts_ls.enable = true;
        tailwindcss.enable = true;
        gopls.enable = true;
        golangci_lint_ls.enable = true;
        templ.enable = true;
        pylsp.enable = true;
#         ocamllsp = {
#           enable = true;
#           package = pkgs.ocamlPackages.ocaml-lsp;
#         };
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        zls.enable = true;
     };
    };
  };
}
