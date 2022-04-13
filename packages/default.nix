{ config, pkgs, ... }:
let 
  comma = import ( pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "comma";
    rev = "02e3e5545b0c62595a77f3d5de1223c536af0614";
    sha256 = "sha256-WBIQmwlkb/GMoOq+Dnyrk8YmgiM/wJnc5HYZP8Uw72E=";
  }) {};

in

{
  # Set fonts
  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [ fira-code font-awesome roboto roboto-mono ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  imports = [
    ./shell.nix
    ./nix.nix
    ./editor.nix
    ./wm.nix
    ./db.nix
    ./brew.nix
    ./spacevim.nix
  ];

  environment.systemPackages = with pkgs; [
    # Dependencies for Ruby/Nokogiri
    (lowPrio ruby_2_7)
    ruby_3_1
    rubyPackages_3_1.pry
    rubyPackages_3_1.pry-byebug
    rubyPackages_3_1.parallel
    rubyPackages_3_1.rails
    rubyPackages_3_1.awesome_print
    rubyPackages_3_1.rest-client
    bundix
    libiconv
    libxml2
    libxslt
    zlib

    # Nix utils
    # nixFlakes
    nox
    niv
    # nixUnstable
    lorri
    direnv
    comma

    # Core utils
    autoconf
    automake
    cmake
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
    duti       # Change default applications for extensions on Mac
    fasd
    fortune
    ffmpeg-full
    fzf
    # python38Packages.howdoi
    htop
    # kaggle
    pstree
    speedtest-cli
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
    # Base utils
    bat               # cat
    bottom            # htop
    broot             # tree + cd alternative
    du-dust           # du
    exa               # ls
    # fd              # df
    fd                # find
    # ion             # bash alternative from Redox OS
    ouch              # tar, gzip, zip etc
    procs             # ps
    rargs             # xargs
    rm-improved       # similar to rm with added features
    ripgrep           # ag
    ripgrep-all       # ag but for PDFs, books, docs, ZIP etc
    tokei             # cloc

    # Git utils
    gitui             # CLI git client
    tig               # ncurses interface for git

    # File browser
    diskonaut         # treemap representation
    # ddh             # duplicate file finder
    fselect           # find files like SQL queries

    # Specific file operations
    bingrep           # grep through binaries
    # fblog           # format JSON log like Kibana
    # funzzy          # file watcher
    hexyl             # disassembler
    mdbook            # write book in Markdown
    mdcat             # Markdown formatter
    xsv               # CSV displayer

    bandwhich         # bandwidth analyzer
    # checkpwn        # check HIBP database
    grex              # generate regex from sample strings
    mcfly             # better history search
    pueue             # CLI task management system

    # Languages
    adoptopenjdk-bin
    chez
    elixir
    elixir_ls
    elmPackages.elm
    erlang
    go
    leiningen
    lua5_4
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    pipenv
    python39Full
    python39Packages.setuptools
    python39Packages.pip
    python39Packages.venvShellHook
    python39Packages.virtualenv
    swiProlog
    yarn
    ghc
    stack
    wabt

    # rustup
    rustc
    cargo
    rust-analyzer
    rustfmt
    evcxr

    # SCM
    git

    # SCM alternatives
    fossil
    mercurial
    pijul
    subversion

    # Web
    lynx
    w3m

    # Servers
    darkhttpd
    nginx

    # Databases
    # pgcli
    # mongodb

    # Deploy
    flyctl

    clang
    llvm

    # Dev tools
    # rkdeveloptool
    # qemu
    # qemu_full

    # Text editors
    emacs
    neovim
  ];
}

