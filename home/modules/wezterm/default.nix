{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()
      config.enable_wayland = false
      config.front_end = "WebGpu"
      config.color_scheme = "Catppuccin Mocha"
      config.window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
      }
      return config
    '';
  };
}
