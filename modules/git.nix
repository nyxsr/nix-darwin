{ config, pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Sahrul Ramdan";
    userEmail = "sahrulramdan.75@gmail.com";
  };
}
