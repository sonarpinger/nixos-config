{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      esbenp.prettier-vscode
    ];

    userSettings = {
      "editor.fontSize" = 14;
      "editor.tabSize" = 2;
      # "files.autoSave" = "onFocusChange";
      "terminal.integrated.shell.linux" = "zsh";
    };
  };
}

