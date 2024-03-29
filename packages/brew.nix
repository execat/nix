{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup =  "zap";
      upgrade = true;
    };
    global = {
      brewfile = true;
    };
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-drivers"
      "sunnyyoung/repo"
      "pharo-project/pharo"
      "nrlquaker/createzap" # https://github.com/nrlquaker/homebrew-createzap
    ];
    brews = [
      "thefuck"
      "zmq"
    ];
    casks = [
      # WM
      "amethyst"

      # Browsers
      "bitwarden"
      "chromium"
      "firefox"
      "waterfox"
      "vivaldi"

      # Alternative browsers
      "beaker-browser"
      "ipfs"
      "lagrange"        # Finger, Gopher, Gemini
      "tor-browser"

      # Hardware support
      "logitech-options"
      "mos"
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
      # "mas"
      "meetingbar"
      "menumeters"
      "smcfancontrol"
      "spaceradar"

      # Music
      "neteasemusic"
      "strawberry"
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
      "mpv"
      "smplayer"
      "tuxguitar"
      "vlc"

      # Video editing
      "kdenlive"
      "openshot-video-editor"
      "shotcut"

      # Programming
      "github"
      "virtualbox"
      # "virtualbox-extension-pack"

      # Languages
      "racket"

      # Devices
      "android-file-transfer"
      "android-platform-tools"

      # IDE
      "anaconda"
      "android-studio"
      "emacs"
      "gdevelop"
      "hex-fiend"
      "livebook"
      "pharo-launcher"          # Smalltalk environment
      "r"
      "rstudio"
      "sublime-text"
      "textmate"

      # RestClient
      # "cocoarestclient"
      "http-toolkit"
      "insomnia"
      # "postman"

      # Task maanger
      "anki"
      "notion"
      "nvalt"                   # Notational Velocity
      "obsidian"

      # Book
      "adobe-acrobat-reader"
      "adobe-digital-editions"
      "calibre"
      # "pdf-expert" # Paid with trial for editing PDFs
      "sigil" # Epub editor
      # "ultimate" # Paid with trial

      # Drawing
      "krita"
      "inkscape"
      "pinta"                   # Password
      "mono-mdk"
      "xournal-plus-plus"

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
      "google-earth-pro"
      "kap"
      "karabiner-elements"      # Password
      "meld"
      "numi"
      "squeak"
      "tomighty"
      "suspicious-package"
      "vienna"
      "xquartz"

      # Good to have communication
      "bluejeans"
      "discord"
      "keybase"
      "skype"
      "telegram"
      "zoom"

      # 3D printing
      # Considered repetier-host, slic3r, wings3d
      "ultimaker-cura"
      "openscad"
      "kicad"

      # Games
      "0-ad"
      # "chessx"
      "minecraft"
      "openttd"
      "openrct2"
      "steam"
      "widelands"

      # Brew fonts
      "font-inconsolata-nerd-font"
      "font-meslo-lg-nerd-font"
      "font-noto-nastaliq-urdu"
    ];
    masApps = {
      # WireGuard = 1451685025;
    };
  };
}
