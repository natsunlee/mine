{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font.size = 14.0;
    };
  };
}
