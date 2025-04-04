{ config, pkgs, lib, ... }:

{
  # Define packages to be installed for the user via Home Manager
  home.packages = with pkgs; [
    devenv
    nixd
    zellij
    bat
    fzf
    ripgrep
    jq
    neofetch
    htop
    lazydocker
    lazygit
    repomix
    thefuck
    tree
    zoxide
    oh-my-posh
    eza
    hasura-cli
    python311
    nodejs
    go
    bun
    yarn
    gcc
    cmake
    pkg-config
    ffmpeg
    imagemagick
    graphicsmagick
    flac
    python311Packages.numpy
    openblas
  ];

}
