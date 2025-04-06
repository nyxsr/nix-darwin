{ config, pkgs, ...} : {
  fonts.packages = [
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.fira-code
  ];
}
