{ config, pkgs, ... }: {
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
    ];
    brews = [
      "borders"
      "lolcat"
    ];
    casks = [
      "orbstack"
      "nikitabobko/tap/aerospace"
      "figma"
      "obsidian"
      "google-chrome"
      "ubersicht"
      "pika"
      "discord"
      "apidog"
      "google-cloud-sdk"
      "ghostty"
      "medis"
      "opera"
      "visual-studio-code"
      "mongodb-compass"
    ];
    masApps = {
      "Whatsapp Messenger" = 310633997;
      "Amphetamine" = 937984704;
    };
  };
}
