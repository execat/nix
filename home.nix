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

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-extras"
        "man"
        "fasd"
        "globalias"
        "history"
        "ssh-agent"
        "thefuck"
        "vi-mode"
      ];
      theme = "af-magic";
    };
    shellAliases = {
      # Update
      update_mac = "sudo softwareupdate -iva";
      
      # Shell shortcuts
      x = "exit";
      ll = "ls -al";
      ln = "ln -v";
      l = "ls -al";
      lsd = "ls -lF | grep \/$";
      mkdir = "mkdir -p";
      e = "$EDITOR";
      # v = "$VISUAL";
      path = "echo $PATH | tr -s \":\" \"\n\"";
      rscp = "rsync --partial --progress --rsh = ssh";
      convim = "vim -u /usr/share/vim/vimrc";
      agi = "ag -i";
      ccat = "ccat --bg = dark";
      v = "f -t -e vim -b viminfo";
      j = "fasd_cd -d";
      
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
      bindkey '^R' history-incremental-pattern-search-backward
      bindkey '^F' history-incremental-pattern-search-forward
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
        hostname = "192.168.1.102";
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
    };
  };
}
