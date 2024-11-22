{ pkgs, ... }

{
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
}
