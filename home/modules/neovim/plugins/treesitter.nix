{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        auto_install = true;
      };
    };
    treesitter-context.enable = true;
    ts-context-commentstring.enable = true;
  };
}
