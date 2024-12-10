{ machineConfig, pkgs, lib, ... }:

let
  nixFilesInDirectory = directory:
    (
      (
        builtins.filter
          (
            node:
              (builtins.isList (builtins.match ".+\.nix$" (builtins.toString node))) &&
              # checking that it is NOT a directory by seeing
              # if the node name forcefully used as a directory is an invalid path
              (!builtins.pathExists "${builtins.toString node}/.")
          )
          (lib.filesystem.listFilesRecursive directory)
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
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      # home.homeDirectory = home; # clashes with nix-darwin
      home.stateVersion = machineConfig.homeManager.stateVersion;

      # Let home-manager install and manage itself
      #programs.home-manager.enable = true;

      fonts.fontconfig.enable = true;

      # Automatically add packages described by flakes in specified dirs.
      # Full list of things configurable via `programs.<name>` available at
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.abook.enable
      imports = nixFilesInDirectories [
        ./packages/apps
        ./packages/cli
        ./packages/macos
      ];

      home.packages = with pkgs; [
        # Other
        arc-browser

        # Fonts
	fira-code
      ];
    };
  };
}
