{ config, lib, pkgs, ... }:

with lib;

let
  # Personal Info
  name = "Anuj More";
  email = "anujmorex@gmail.com";
  githubUsername = "execat";
in {
  imports = [
    ./nix
    ./packages
    ./system
    ./networking
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;
    variables = {
      # NIX_PATH="darwin-config=$HOME/.nix/darwin-configuration.nix:$HOME/.nix-defexpr/channels";
      ASPELL_CONF = "data-dir ${pkgs.aspell}";
      LANG = "en_US.UTF-8";
      GITSTATUS_LOG_LEVEL = "DEBUG";
      EDITOR = "vim";
      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux#configuration-variables
      # automatically start tmux
      ZSH_TMUX_AUTOSTART = "true";
      ZSH_TMUX_CONFIG = "$XDG_CONFIG_HOME/tmux/tmux.conf";

      hello = "meow";
    };
  };

  # programs.git = {
  #   enable = true;
  #   userName = "${name}";
  #   userEmail = "${email}";
  #   extraConfig = {
  #     pull.rebase = false;
  #     # url = { "git@github.com:" = { insteadOf = "https://github.com"; }; };
  #   };
  # };

  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    global = {
      brewfile = true;
    };
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-drivers"
    ];
    brews = [];
    casks = [
      # Markdown_editors
      "macdown"
      # "typora"

      # Book
      "calibre"
      "pdf-expert" # Paid with trial for editing PDFs
      "sigil" # Epub editor
      "skim"

      # Security
      "gpg-suite"
      "yubico-yubikey-manager"
      "yubico-yubikey-personalization-gui"
      "yubico-yubikey-piv-manager"

      # Utils
      "alacritty"
      "angry-ip-scanner"
      "arduino"
      "background-music"
      "balenaetcher"
      "charles"
      "clover-configurator"
      "docker"
      "dash"
      # "deeper"
      "diffmerge"
      "dropbox"
      "flux"
      "iterm2"
      "jdiskreport"
      "kap"
      "karabiner-elements"
      "keka"
      "keepingyouawake"
      "launchrocket"
      "lulu"
      "meetingbar"
      "meld"
      "menumeters"
      "numi"
      "nvalt"
      "selfcontrol"
      "smcfancontrol"
      "squeak"
      "tomighty"
      "suspicious-package"
      "tunnelblick"
      "vienna"

      # Music
      "clementine"
      "neteasemusic"
      "transmission"

      # Database
      "dbeaver-community"
      "sequel-pro"
      "db-browser-for-sqlite"

      # Drawing
      "krita"
      "inkscape"
      "pinta"
      "mono-mdk"

      # Animation
      "blender"
      "gimp"
      "opentoonz"
      "pencil2d"
      "synfigstudio"

      # Communication
      "bluejeans"
      "discord"
      "element"
      "flume"
      "keybase"
      "noti"
      "nordvpn"
      "skype"
      "thunderbird"
      "telegram"
      "wechat"
      "zoom"

      # Browsers
      "bitwarden"
      "firefox"
      "google-chrome"
      "tor-browser"
      "beaker-browser"
      "vivaldi"
      "chromium"
      # "brave-browser-nightly"
      # "opera-beta"
      "ipfs"

      # Media
      "audacity"
      "iina"
      "kodi"
      "tuxguitar"
      "vlc"

      # Games
      "0-ad"
      "openttd"
      "steam"
      "widelands"

      # Programming
      "kitematic"
      "parallels"
      "github"
      "virtualbox"
      "virtualbox-extension-pack"

      # Languages
      "racket"

      # IDE
      "anaconda"
      "android-studio"
      "atom"
      "intellij-idea-ce"
      "hex-fiend"
      "r"
      "rstudio"
      "sublime-text"
      "textmate"
      "visual-studio-code"

      # RestClient
      "cocoarestclient"
      "insomnia"
      "postman"

      # Hardware support
      "logitech-options"

      # Brew fonts
      "font-inconsolata-dz-for-powerline"
      "font-inconsolata-for-powerline"
      # "font-inconsolata-g-for-powerline"
      "font-menlo-for-powerline"
      "font-meslo-for-powerline"
      # "font-noto-mono-for-powerline"
    ];
    masApps = {
      WireGuard = 1451685025;
    };
  };

  services = {
    yabai = {
      enable = true;
      package = pkgs.yabai;
      # enableScriptingAddition = false;
      config = {
        layout                     = "bsp";
        top_padding                = 4;
        bottom_padding             = 24;
        left_padding               = 4;
        right_padding              = 4;
        window_gap                 = 4;
        
        focus_follows_mouse        = "off";
        mouse_follows_focus        = "on";
        
        mouse_modifier             = "fn";
        mouse_action1              = "move";
        mouse_action2              = "resize";

        window_topmost             = "off";
        window_opacity             = "off";
        window_shadow              = "float";
        
        active_window_opacity      = "1.0";
        normal_window_opacity      = "0.9";
        split_ratio                = "0.5";
        auto_balance               = "off";

        window_border              = "on";
        window_border_width        = "2";
        active_window_border_color = "0xE0808080";
        insert_window_border_color = "0xE02d74da";
        normal_window_border_color = "0xE0010101";
        window_placement           = "second_child";
      };

      extraConfig = mkDefault ''
        # rules
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add label="System Preferences" app="^System Preferences$" manage=off
        yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
        yabai -m rule --add label="VirtualBox" app="^VirtualBox$" manage=off

        yabai -m rule --add app=Emacs manage=on space=2
      '';
    };

    skhd = {
      enable = true;
      skhdConfig = builtins.readFile ./resources/skhdrc;
    };
  };
}
