{ config, pkgs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
      "homebrew/cask"
      "nikitabobko/tap"
      "FelixKratz/formulae"
      "encoredev/tap"
    ];
    brews = [
      "borders"
      "lolcat"
      "encore"
    ];
    casks = [
      "orbstack"
      "nikitabobko/tap/aerospace"
      "figma"
      "google-chrome"
      "ubersicht"
      "pika"
      "discord"
      "apidog"
      "ghostty"
      "medis"
      "opera"
      "visual-studio-code"
      "mongodb-compass"
      "keycastr"
      "raycast"
      "zed"
      "alacritty"
    ];
    masApps = {
      "Whatsapp Messenger" = 310633997;
      "Amphetamine" = 937984704;
    };
  };
}
