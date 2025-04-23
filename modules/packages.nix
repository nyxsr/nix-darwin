{ config, pkgs, lib, ... }:

{
  # Define packages to be installed for the user via Home Manager
  home.packages = with pkgs; [
    btop
    mas
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
    python311
    hasura-cli
    nodejs
    bun
    yarn
    pkg-config
    ffmpeg
    imagemagick
    graphicsmagick
    flac
    python311Packages.numpy
    openblas
    kubectl
    kubernetes-helm
  ];

}
