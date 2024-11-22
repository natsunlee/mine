{ config, pkgs, ... }:

{
  home.stateVersion = "23.05";

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  home.packages = with pkgs; [];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.file = {
    ".wezterm.lua".source = ./.wezterm.lua;
  };
}
