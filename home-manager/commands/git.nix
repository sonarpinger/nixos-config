{ username, user, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = username;
    userEmail = user.email;
    extraConfig = {
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
      };
    };
    ignores = [
      ".direnv"
      ".venv"
    ];
    signing = {
      signByDefault = true;
      key = "/home/${username}/.ssh/id_ed25519.pub";
    };
  };
}
