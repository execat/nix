{ config, pkgs, ... }:

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
  ];

  environment.systemPackages = with pkgs; [
    # Dependencies for Ruby/Nokogiri
    (lowPrio ruby_2_7)
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
    # nixFlakes
    nox
    # nixUnstable
    lorri
    direnv

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
    # kaggle
    pstree
    speedtest-cli
    tmux
    tree
    tldr
    wget
    xz
    # youtube-dl

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
    rust-analyzer
    rustfmt

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
    mongodb

    clang
    llvm

    # Dev tools
    # rkdeveloptool
    # qemu
    # qemu_full

    # Text editors
    neovim
  ];
}
