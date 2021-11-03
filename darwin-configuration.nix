{ config, lib, pkgs, ... }:

with lib;

let
  # Personal Info
  name = "Anuj More";
  email = "anujmorex@gmail.com";
  githubUsername = "execat";
in {
  imports = [
    ./nix
    ./packages
    ./system
    ./networking
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

