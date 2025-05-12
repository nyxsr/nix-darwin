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
  	 "opera"
  	 "orbstack"
     "nikitabobko/tap/aerospace"
     "figma"
     "obsidian"
     "google-chrome"
     "ubersicht"
     "alacritty"
     "pika"
     "discord"
     "apidog"
     "google-cloud-sdk"
     "ghostty"
    ];
   	masApps = {
  	 "Whatsapp Messenger" = 310633997;
     "Amphetamine" = 937984704;
   	};
  };
}
