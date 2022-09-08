{ config, lib, pkgs, ... }:

{
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.nix/darwin-configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.root.shell = pkgs.bashInteractive;

  nix = {
    # package = pkgs.nixFlakes;
    # extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes) "experimental-features = nix-command flakes";
    # Use this option to avoid issues on macOS version upgrade
    configureBuildUsers = true;
  };
}
