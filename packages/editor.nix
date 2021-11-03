{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    enableSensible = true;
    plugins = [
      { names = [ "surround" "nerdtree" "vim-airline" "vim-nix" ]; }
    ];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
