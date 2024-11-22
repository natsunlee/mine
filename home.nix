{ config, pkgs, ... }:

{
  home.stateVersion = "23.05";

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim

    # Basic Utilities
    tmux
    fzf
    zoxide
    bat
    eza
  ];

  home.file = {
    ".wezterm.lua".source = ./.wezterm.lua;
  };
}
