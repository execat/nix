{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "atm";
  home.homeDirectory = "/Users/atm";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  manual.html.enable = true;
  manual.json.enable = true;

  home.sessionVariables = {
    NIX_PATH="darwin-config=$HOME/.nix/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH";
    PATH="$PATH:$HOME/.gem/ruby/3.0.0/bin:/usr/local/anaconda3/bin";
  };

  programs.zsh = {
    enable = true;
    history.extended = true;
    plugins = [
      {
        name = "you-should-use";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "1.7.3";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "07c075c13938a7f527392dd73da2595a752cae6b";
          sha256 = "1xkygi6r083aws16fwv9q1vfbhc48k84x08f607bh6mjwnjqcbf1";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-extras"
        "man"
        "fasd"
        "fzf"
        "globalias"
        "ssh-agent"
        "thefuck"
        "vi-mode"
      ];
      theme = "af-magic";
    };
    shellAliases = {
      # Update
      update_mac = "sudo softwareupdate -iva";

      # Rust util overrides
      # ls
      l = "exa -al";
      ll = "exa -al";
      ls = "exa";
      lsd = "exa -lF | grep \/$";

      # Other utils
      cat = "bat";
      du = "dust";
      htop = "btm";

      # TODO: check if anything interesting on https://github.com/rust-unofficial/awesome-rust#development-tools

      # Common shortcuts
      path = "echo $PATH | tr -s \":\" \"\n\"";
      nix_path = "echo $NIX_PATH | tr -s \":\" \"\n\"";

      # Shell shortcuts
      x = "exit";
      e = "$EDITOR";
      # v = "$VISUAL";
      rscp = "rsync --partial --progress --rsh = ssh";
      convim = "vim -u /usr/share/vim/vimrc";
      agi = "ag -i";
      ccat = "ccat --bg = dark";
      v = "f -t -e vim -b viminfo";
      j = "fasd_cd -d";
      ln = "ln -v";
      mkdir = "mkdir -p";

      # Python
      update_pip_3 = "pip3 install --upgrade pip setuptools wheel";

      # Ruby
      be = "bundle exec";
      bi = "bundle install";
      hist = "history | grep";

      # Downloads
      dl_webpages = "wget -A html,pdf,txt -m -p -E -k -K -np -e robots = off -U mozilla";

      # tmux
      tatt = "tmux attach-session -t";
      tlist = "tmux list-sessions";
      tnew = "tmux new -s";

      # Postgres
      laptop_pg_create_user = "createuser -d -s -P";

      # NPM
      npmlist = "npm list -g --depth 0";
    };
    loginExtra = ''
      setopt extendedglob
      # source $HOME/.aliases

      eval "$(direnv hook zsh)"
      eval $(thefuck --alias)
    '';
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal "screen-256color"

      # THEME
      set -g status-bg black
      set -g status-fg white
      set -g status-left-length 60
      set -g status-right-length 60
      set -g status-left ' #[default]'
      set -g status-right '#[fg=colour200]%H:%M#[default]'
      set -g mouse on

      #set-option -g status-left "#(~/Git/tmux-powerline/status-left.sh)"
      #set-option -g status-right "#(~/Git/tmux-powerline/status-right.sh)"

      # Start at 1
      set -g base-index 1

      setw -g window-status-format '#[fg=colour235]#I #[fg=white]#W#[default]  '
      setw -g window-status-current-format '#[bg=white,fg=black]⮀ #W #[bg=black,fg=white]⮀'

      ## GNU Screen bindings
      # Set the prefix to ^A.
      unbind C-b
      set -g prefix ^A
      bind a send-prefix

      # lockscreen ^X x
      unbind ^X
      bind ^X lock-server
      unbind x
      bind x lock-server

      # screen ^C c
      unbind ^C
      bind ^C new-window
      bind c new-window

      # detach ^D d
      unbind ^D
      bind ^D detach

      # displays *
      unbind *
      bind * list-clients

      # next ^@ ^N sp n
      unbind ^@
      bind ^@ next-window
      unbind ^N
      bind ^N next-window
      unbind " "
      bind " " next-window
      unbind n
      bind n next-window

      # title A
      unbind A
      bind A command-prompt "rename-window %%"

      # other ^A
      unbind ^A
      bind ^A last-window

      # prev ^H ^P p ^?
      unbind ^H
      bind ^H previous-window
      unbind ^P
      bind ^P previous-window
      unbind p
      bind p previous-window
      unbind BSpace
      bind BSpace previous-window

      # windows ^W w
      unbind ^W
      bind ^W list-windows
      unbind w
      bind w list-windows

      # quit \
      #unbind \
      # bind \ confirm-before "kill-server"

      # kill K k
      unbind K
      bind K confirm-before "kill-window"
      unbind k
      bind k confirm-before "kill-window"

      # redisplay ^L l
      unbind ^L
      bind ^L refresh-client
      unbind l
      bind l refresh-client

      # split -v |
      unbind |
      bind | split-window

      # :kB: focus up
      unbind Tab
      bind Tab select-pane -t:.+
      unbind BTab
      bind BTab select-pane -t:.-

      # " windowlist -b
      unbind '"'
      bind '"' choose-window
    '';
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "wuxi" = {
        host = "wuxi";
        identitiesOnly = true;
        identityFile = ["~/.ssh/localhost"];
        user = "atm";
        hostname = "192.168.1.101";
      };
      "lhasa" = {
        host = "lhasa";
        identitiesOnly = true;
        identityFile = ["~/.ssh/localhost"];
        user = "atm";
        hostname = "192.168.1.103";
      };
      "pi" = {
        host = "pi";
        identitiesOnly = true;
        identityFile = ["~/.ssh/localhost"];
        user = "pi";
        hostname = "192.168.1.125";
      };
      "chengdu" = {
        host = "chengdu";
        identitiesOnly = true;
        identityFile = ["~/.ssh/localhost"];
        user = "atm";
        hostname = "192.168.1.114";
      };
      "yantai" = {
        host = "yantai";
        identitiesOnly = true;
        identityFile = ["~/.ssh/localhost"];
        user = "atm";
        hostname = "192.168.1.131";
      };
      "digitalocean" = {
        host = "digitalocean";
        identitiesOnly = true;
        identityFile = ["~/.ssh/digitalocean"];
        user = "atm";
        hostname = "192.168.1.1";
      };
      "github" = {
        host = "githhub";
        identitiesOnly = true;
        identityFile = ["~/.ssh/github"];
        user = "git";
        hostname = "github.com";
      };
      "srht" = {
        host = "srht";
        identitiesOnly = true;
        identityFile = ["~/.ssh/srht"];
        user = "git";
        hostname = "git.sr.ht";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Anuj More";
    userEmail = "anujmorex@gmail.com";
    delta.enable = true;
    aliases = {
      st = "status";
      ca = "commit -a";
      br = "branch";
      ds = "diff --staged";
      unstage = "reset HEAD";
      uncommit = "reset --soft HEAD^";
      olog = "log --oneline";
      diffp = "diff --color --patience";
      diffi = "diff --color --color-words --abbrev --ignore-all-space";
      diffw = "diff --color --color-words --abbrev";
      diffwp = "diff --color --color-words --abbrev --patience";
      diffn = "diff --color --name-status";
      lp = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --name-status";
      l = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      unpushed = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches --not --remotes";
      sync = "remote update origin --prune";
      pl = "merge --ff-only @{u}";
      forget="! /usr/local/bin/git fetch -p && /usr/local/bin/git branch -vv | awk '/: gone]/{print $1}' | xargs /usr/local/bin/git branch -D";
    };
    ignores = [
      "*~"
      "*.swp"
      "*.swo"
      ".bundle"
      "zeus.json"
      ".DS_Store"
    ];
    extraConfig = {
      core.editor = "vim";
      core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      init.defaultBranch = "dev";
      merge.conflictstyle = "diff3";
      pull.rebase = "false";
      push.default = "current";
    };
  };

  programs.java = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # JavaScript, React
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode

      # Git
      donjayamanne.githistory
      eamodio.gitlens

      # From VSCode Marketplace
      # rebornix.Ruby
      # bbenoist.Nix
      # Github.copilot

      # Not on vscode-extensions yet:
      # castwide.solargraph
      # HookyQR.beautify
      # rbbit.typescript-hero
      # suming.react-proptypes-generate
      # ms-vscode.Go
      # wmaurer.change-case
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Ruby";
        publisher = "rebornix";
        version = "0.28.1";
        sha256 = "179g7nc6mf5rkha75v7rmb3vl8x4zc6qk1m0wn4pgylkxnzis18w";
      }
      {
        name = "copilot";
        publisher = "Github";
        version = "1.6.3571";
        sha256 = "00sw75my466mzsrqjafzxbzv397vmlfafllbljvql6crxpl45v57";
      }
      {
        name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }
    ];
  };
}

