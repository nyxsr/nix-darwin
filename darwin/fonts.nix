{ config, pkgs, ...} : {
  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];
}
