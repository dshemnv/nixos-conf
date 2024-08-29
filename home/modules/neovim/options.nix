{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";

      splitbelow = true;
      splitright = true;

      swapfile = false;
      undofile = true;

      incsearch = true;
      ignorecase = true;
      smartcase = true;

      scrolloff = 8;
      fileencoding = "utf-8";
      termguicolors = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
    };
  };
}
