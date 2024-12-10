{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font.size = 14.0;
      font.normal.family = "Fira Code";
      font.bold.family = "Fira Code";
      font.italic.family = "Fira Code";
      font.bold_italic.family = "Fira Code";
    };
  };
}
