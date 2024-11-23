{ rev, user, ... }: { pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.vim
    ];

  security.pam.enableSudoTouchIdAuth = true;

  # https://mynixos.com/nix-darwin/options/system.defaults
  system.defaults = {
    controlcenter.BatteryShowPercentage = true;

    dock = {
      autohide = true;
      autohide-delay = 0.15;
      mru-spaces = false;
      tilesize = 55;
      expose-animation-duration = 0.5;
      show-recents = false;

      # Disable all hot corners
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

    NSGlobalDomain = {
      InitialKeyRepeat = 20;
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

    # Disable mouse acceleration.
    # Proper nix-darwin setting pending (https://github.com/LnL7/nix-darwin/pull/1037).
    CustomSystemPreferences.NSGlobalDomain."com.apple.mouse.linear" = true;
    CustomUserPreferences.NSGlobalDomain."com.apple.mouse.linear" = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = rev;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
  };
}
