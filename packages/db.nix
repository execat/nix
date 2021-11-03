{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
  };

  services.redis = {
    enable = true;
    package = pkgs.redis;
  };
}
