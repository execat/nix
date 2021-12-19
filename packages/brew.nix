{ config, lib, pkgs, ... }:

{
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
      "sunnyyoung/repo"
    ];
    brews = [
      "thefuck"
      "zmq"
    ];
    casks = [
      # WM
      # "amethyst"

      # Browsers
      "bitwarden"
      "chromium"
      "firefox"
      "vivaldi"

      # Alternative browsers
      "beaker-browser"
      "ipfs"
      "lagrange"        # Finger, Gopher, Gemini
      "tor-browser"

      # Hardware support
      "logitech-options"
      "plover"
      "zsa-wally"

      # Security
      "gpg-suite"
      "yubico-yubikey-manager"
      "yubico-yubikey-personalization-gui"
      "yubico-yubikey-piv-manager"

      # Essential utils
      "balenaetcher"
      "clover-configurator"
      "diffmerge"
      "dropbox"
      "flux"
      "iterm2"
      "keka"
      "keepingyouawake"
      "launchrocket"
      "lulu"
      "meetingbar"
      "menumeters"
      "smcfancontrol"
      "spaceradar"

      # Music
      "clementine"
      "neteasemusic"
      "transmission"

      # Database
      "dbeaver-community"
      "sequel-pro"
      "db-browser-for-sqlite"

      # Essential communication
      "element"
      "nordvpn"
      "thunderbird"
      "wechat"
      "wechattweak-cli"

      # Media
      "audacity"
      "iina"
      "kodi"
      # "tuxguitar"
      "vlc"

      # Programming
      "github"
      "virtualbox"
      "virtualbox-extension-pack"

      # Languages
      "racket"

      # IDE
      "anaconda"
      "android-studio"
      "hex-fiend"
      "sublime-text"
      "textmate"

      # RestClient
      # "cocoarestclient"
      "insomnia"
      # "postman"

      # Task maanger
      "anki"
      "notion"
      "nvalt"                   # Notational Velocity
      "obsidian"

      # Book
      "calibre"
      "pdf-expert" # Paid with trial for editing PDFs
      "sigil" # Epub editor

      # Drawing
      "krita"
      "inkscape"
      "pinta"                   # Password
      "mono-mdk"

      # Animation
      "blender"
      "gimp"
      "opentoonz"
      "pencil2d"
      "synfigstudio"

      # Nice to have utils
      "alacritty"
      "angry-ip-scanner"
      "arduino"
      # "background-music"
      "charles"
      "docker"
      # "deeper"
      "devdocs"
      "kap"
      "karabiner-elements"      # Password
      "meld"
      "numi"
      "squeak"
      "tomighty"
      "suspicious-package"
      "vienna"

      # Good to have communication
      "bluejeans"
      "discord"
      "keybase"
      "skype"
      "telegram"
      "zoom"

      # 3D printing
      "repetier-host"
      "slic3r"

      # Games
      "0-ad"
      # "chessx"
      "minecraft"
      "openttd"
      "steam"
      "widelands"

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
}
