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
    # libiconv
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
    # kaggle
    pstree
    speedtest-cli
    # thefuck
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
    # ddh               # duplicate file finder
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

