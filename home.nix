{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/alacritty.nix
  ];

  home.username = "sahrulramdan";
  home.homeDirectory = lib.mkForce "/Users/sahrulramdan";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
