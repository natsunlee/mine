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
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    darwinConfigurations."darwin" = nix-darwin.lib.darwinSystem {
      modules = [
        (
	  import ./darwin.nix
	  {
	    rev = self.rev or self.dirtyRev or null;
	    user = "nathan";
	  }
	)
        home-manager.darwinModules.home-manager
	{
          nixpkgs.config.allowUnfree = true;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.users.nathan = import ./nix/home-manager/home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."darwin".pkgs;
  };
}
