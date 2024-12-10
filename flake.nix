{
  description = "Base system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, nix-homebrew, ... }@inputs:
  let
    machineConfig = {
      system =  "aarch64-darwin";
      hostname = "guiltyspark";
      username = "nathan";
      home = "/Users/nathan";
      homeManager.stateVersion = "23.05";
      rev = self.rev or self.dirtyRev or null;
    };
    pkgs = import nixpkgs { system = machineConfig.system; config.allowUnfree = true; };
  in
  {
    darwinConfigurations."darwin" = nix-darwin.lib.darwinSystem {
      system = machineConfig.system;
      inherit pkgs;
      specialArgs = { inherit inputs machineConfig; };

      modules = [
        ./nix/darwin
        nix-homebrew.darwinModules.nix-homebrew (import ./nix/homebrew)
	home-manager.darwinModules.home-manager (import ./nix/home-manager)
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."darwin".pkgs;
  };
}
