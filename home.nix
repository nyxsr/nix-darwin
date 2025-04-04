{ config, pkgs, lib, ... }:
{
  imports = [
    ./modules/nvim.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/packages.nix
  ];

  home.username = "nyxsr";
  home.homeDirectory = lib.mkForce "/Users/nyxsr";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
