{ config, pkgs, ... }:

{
  programs.bash= {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    variables = {
      ASPELL_CONF = "data-dir ${pkgs.aspell}";
      LANG = "en_US.UTF-8";
      GITSTATUS_LOG_LEVEL = "DEBUG";
      EDITOR = "vim";
      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux#configuration-variables
      # automatically start tmux
      ZSH_TMUX_AUTOSTART = "true";
      ZSH_TMUX_CONFIG = "$XDG_CONFIG_HOME/tmux/tmux.conf";
    };
  };
}