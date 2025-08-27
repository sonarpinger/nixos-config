{
  pkgs,
  ...
}:

{
  imports = [
    ./plugins/default.nix
    ./config.nix
    ./keymaps.nix
  ];

}
