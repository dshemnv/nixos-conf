{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../modules/neovim
    ../modules/tmux
    ../modules/wezterm
  ];
  home = {
    username = "dshem";
    homeDirectory = "/home/dshem";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    alejandra
    htop
    lf
    wget
    curl
    lshw
    floorp
    discord
    zinit
  ];


  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/dshem/nixos";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      function fish_greeting; end
      '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.git = {
    enable = true;
    userName = "dshem";
    userEmail = "dshem@gmx.fr";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = ["--cmd cd"];
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
  };

  programs.fzf = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
