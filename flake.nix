{
  description = "Base MacOS system flake";

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
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.vim
          pkgs.neovim
        ];

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
	controlcenter.BatteryShowPercentage = true;

	dock = {
	  autohide = true;
	  mru-spaces = false;
	  tilesize = 55;
	  expose-animation-duration = 0.5;
	  show-recents = false;

	  # Hot corners (https://mynixos.com/nix-darwin/option/system.defaults.dock.wvous-bl-corner)
	  wvous-bl-corner = 1;
	  wvous-br-corner = 1;
	  wvous-tl-corner = 1;
	  wvous-tr-corner = 1;
	};
	
	finder = {
	  AppleShowAllExtensions = true;
	  FXPreferredViewStyle = "clmv"; # icon view. Other options are: Nlsv (list), clmv (column), Flwv (cover flow)
	};

        screencapture.location = "~/Pictures/screenshots";

        screensaver.askForPasswordDelay = 10; # in seconds

        NSGlobalDomain = {
	  InitialKeyRepeat = 30;
          KeyRepeat = 1;
	  ApplePressAndHoldEnabled = false; # Disable long-press for accented chars
	  "com.apple.keyboard.fnState" = true;
	};

        menuExtraClock = {
	  FlashDateSeparators = false;
	  ShowSeconds = true;
	};
	
	WindowManager = {
	  EnableStandardClickToShowDesktop = false;
	};
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.nathan.home = "/Users/nathan";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."base" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;
          #home-manager.users.nathan = home-manager-config;
	  home-manager.users.nathan = import ./home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."base".pkgs;
  };
}
