{ config, pkgs, ... }:

{
  # Set fonts
  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [ fira-code font-awesome roboto roboto-mono ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = with pkgs; [
    # Dependencies for Ruby/Nokogiri
    (lowPrio ruby_2_7)
    # ruby
    # rubyPackages.activesupport
    ruby_3_0
    rubyPackages_3_0.pry
    rubyPackages_3_0.parallel
    rubyPackages_3_0.activesupport
    bundix
    libiconv
    libxml2
    libxslt
    zlib

    # Nix utils
    nix-index
    # nixFlakes
    nox
    # nixUnstable
    lorri

    # Core utils
    autoconf
    automake
    coreutils
    findutils
    moreutils
    openssh
    pkg-config

    # GNU utilities
    gawk
    # gcc
    gnused
    gnutar
    gnugrep
    gnupg
    
    # Utilities
    aerc
    cairo
    cloc
    cowsay
    curl
    direnv
    fasd
    fortune
    ffmpeg-full
    fzf
    # python38Packages.howdoi
    htop
    kaggle
    pstree
    ripgrep
    speedtest-cli
    # thefuck
    tmux
    tree
    tldr
    wget
    xz
    youtube-dl
    
    # CLI utils
    jq
    yq

    # Rust utilities
    bat
    dust
    exa
    fd
    hexyl
    mdcat
    tig
    tokei
    xsv

    # Version control
    # fossil
    subversion

    # Languages
    adoptopenjdk-bin
    chez
    elixir
    elmPackages.elm
    erlang
    go
    leiningen
    nodejs
    pipenv
    python38Full
    python38Packages.pip
    python38Packages.venvShellHook
    yarn
    ghc
    stack

    # rustup
    rustc
    cargo

    # Anaconda
    # gophernotes
    # iruby
    # jupyter
    # python38Packages.bash_kernel
    # python38Packages.ipykernel
    # python38Packages.ipython
    # python38Packages.jupyter
    # python38Packages.jupytext
    # python38Packages.jupyter_console
    # python38Packages.nix-kernel
    # python38Packages.notebook

    # SCM
    git

    # Web
    lynx
    w3m

    # Servers
    darkhttpd
    nginx

    # Databases
    # pgcli
    postgresql
    mongodb
    redis

    clang
    llvm

    # Dev tools
    # rkdeveloptool
    # qemu
    # qemu_full
 
    # Text editors
    emacs
    neovim
    vim
    
    # Shell
    bash
    bash-completion
    fish
  ];
}
