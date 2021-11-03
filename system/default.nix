{ config, pkgs, ... }:

{
  # Set timezone
  time.timeZone = "Asia/Singapore";

  # Try to disable .DS_Store: defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  # Disable disk image verification:
  # defaults write com.apple.frameworks.diskimages skip-verify -bool true
  # defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  # defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
  system.defaults = {
    dock = {
      autohide = true;
      autohide-time-modifier = "0.6";
      enable-spring-load-actions-on-all-items = true;
      launchanim = false;
      mineffect = "suck";
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
      mru-spaces = false;
      show-process-indicators = true;
      show-recents = false;
      showhidden = true;
      tilesize = 48;
    };
    finder = {
      _FXShowPosixPathInTitle = true;
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
    };
    LaunchServices = {
      LSQuarantine = false;
    };
    NSGlobalDomain = {
      AppleFontSmoothing = 1;
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = true;
      AppleShowScrollBars = "Always";
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSTableViewDefaultSizeMode = 1;
      NSTextShowsControlCharacters = true;
      NSWindowResizeTime = "0.001";
      PMPrintingExpandedStateForPrint = true;
      # com.apple.mouse.tapBehavior = 1;
      # com.apple.swipescrolldirection = false;
      # com.apple.trackpad.scaling = 2;
    };
    smb = {
      NetBIOSName = "wuxi";
    };
    trackpad = {
      Clicking = true;
      FirstClickThreshold = 0;
      SecondClickThreshold = 0;
      TrackpadThreeFingerDrag = true;
    };
  };
}
