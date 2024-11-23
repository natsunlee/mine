{ config, pkgs, ... }:

let
  nixFilesInDirectory = directory:
    (
      map (file: "${directory}/${file}")
      (
        builtins.filter
          (
            nodeName:
              (builtins.isList (builtins.match ".+\.nix$" nodeName)) &&
              # checking that it is NOT a directory by seeing
              # if the node name forcefully used as a directory is an invalid path
              (!builtins.pathExists "${directory}/${nodeName}/.")
          )
          (builtins.attrNames (builtins.readDir directory))
      )
    );

  nixFilesInDirectories = directoryList:
    (
      builtins.concatMap
        (directory: nixFilesInDirectory directory)
        (directoryList)
    );
in
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Automatically add packages described by flakes in specified dirs
  imports = nixFilesInDirectories [
    ./packages/cli
  ];

  home.packages = with pkgs; [
    # Communications
    slack
    discord
    
    # MacOS Utilities
    bartender
    sensible-side-buttons
    mos

    # Other
    arc-browser
    spotify
    mpv
    alacritty
    obsidian

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  #home.file = {
  #  ".wezterm.lua".source = ./.wezterm.lua;
  #};
}
