{ machineConfig, pkgs, ... }:

{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = machineConfig.rev;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${machineConfig.username} = {
    name = machineConfig.username;
    home = machineConfig.home;
  };

  networking.computerName = machineConfig.hostname;
  networking.hostName = machineConfig.hostname;
  networking.localHostName = machineConfig.hostname;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  security.pam.enableSudoTouchIdAuth = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  #environment.systemPackages =
  #  [
  #    pkgs.vim
  #  ];

  homebrew = import ./homebrew.nix;
  imports = [
    ../packages/macos/paprika-recipe-manager-3.nix
    ../packages/macos/caffeinated.nix
  ];

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
      ShowPathbar = true;
      ShowStatusBar = true;
      FXEnableExtensionChangeWarning = false;
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
    #CustomSystemPreferences = {
    #  NSGlobalDomain."com.apple.mouse.linear" = true;
    #};

    CustomUserPreferences = {
      #NSGlobalDomain."com.apple.mouse.linear" = true;

      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };
  };

}
