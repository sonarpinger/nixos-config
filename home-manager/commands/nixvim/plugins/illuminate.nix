{
  programs.nixvim.plugins = {
    illuminate = {
      enable = true;
      delay = 100;
      minCountToHighlight = 1;
      modesAllowlist = [
        "n"
        "i"
        "v"
      ];
    };
  };
}
