{ config, pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ../resources/doom.d;  # Directory containing your config.el init.el and packages.el files
  };
in {
  programs.vim = {
    enable = true;
    enableSensible = true;
    plugins = [
      { names = [ "surround" "nerdtree" "vim-airline" "vim-nix" ]; }
    ];
  };

  services.emacs = {
    enable = true;
    package = doom-emacs;
  };

  services.lorri = {
    enable = true;
  };
}
