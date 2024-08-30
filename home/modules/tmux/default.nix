{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.tmux-fzf
      tmuxPlugins.fingers
      tmuxPlugins.catppuccin
      tmuxPlugins.extrakto
    ];
  };
}
