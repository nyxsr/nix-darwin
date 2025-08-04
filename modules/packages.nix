{ config, pkgs, lib, ... }:

{
  # Define packages to be installed for the user via Home Manager
  home.packages = with pkgs; [
    claude-code
    rsync
    rustc
    go
    cargo
    neovim
    doggo
    k9s
    kubectx
    kubescape
    ctop
    btop
    mas
    devenv
    nixd
    bat
    fzf
    ripgrep
    jq
    neofetch
    htop
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
    ghostscript
    graphicsmagick
    flac
    python311Packages.numpy
    openblas
    kubectl
    kubernetes-helm
    pnpm
  ];

}
