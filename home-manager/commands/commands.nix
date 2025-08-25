{
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./direnv.nix
    ./git.nix
    # ./nixvim/default.nix
    ../../modules/tmux.nix
    ../../modules/vim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    btop
    curl
    dig
    ffmpeg-full
    fzf
    nmap
    openssl
    ripgrep
    smartmontools
    tailscale
    yt-dlp
  ];

  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        global = {
          host = "*";
          setEnv = {
            TERM = "xterm-256color";
          };
        };
      };
    };
  };
}
