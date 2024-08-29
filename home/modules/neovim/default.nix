{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    # ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    # Small plugins
    plugins = {
      sleuth.enable = true;
    };

    viAlias = true;
    vimAlias = true;
  };

}
