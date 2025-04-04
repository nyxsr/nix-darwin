{ config, pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    vim
    git
    gh
    git-lfs
    mkalias
  ];
}
