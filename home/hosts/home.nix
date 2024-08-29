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
    git
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/dshem/nixos";
    };
  };

  programs.git = {
    enable = true;
    userName = "dshem";
    userEmail = "dshem@gmx.fr";
  };

  programs.home-manager.enable = true;
}
