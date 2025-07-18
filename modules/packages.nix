{ config, pkgs, lib, ... }:

{
  # Define packages to be installed for the user via Home Manager
  home.packages = with pkgs; [
    rustc
    go
    cargo
    neovim
    act
    doggo
    k9s
    kubectx
    kubescape
    ctop
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
    pnpm
  ];

}
