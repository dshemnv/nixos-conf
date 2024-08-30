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
  ];

  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/dshem/nixos";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    history.size = 1000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    zplug = {
      enable = true;
      plugins = [
        {name = "zdharma-continuum/fast-syntax-highlighting";}
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.git = {
    enable = true;
    userName = "dshem";
    userEmail = "dshem@gmx.fr";
  };

  programs.home-manager.enable = true;
}
