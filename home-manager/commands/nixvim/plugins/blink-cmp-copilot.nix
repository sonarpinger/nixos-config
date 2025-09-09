{
  programs.nixvim.plugins.blink-cmp = {
    settings.sources = {
      copilot = {
        async = true;
        module = "blink-cmp-copilot";
        name = "copilot";
        score_offset = 100;
      };
    };
  };
}
