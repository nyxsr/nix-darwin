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
      "sketchybar"
      "borders"
    ];
    casks = [
  	 "zed"
  	 "opera"
  	 "orbstack"
     "nikitabobko/tap/aerospace"
     "figma"
     "kitty"
     "obsidian"
      "pika"
    ];
   	masApps = {
  	 "Whatsapp Messenger" = 310633997; # Whatsapp
      "Amphetamine" = 937984704;
      "RoboForm Password Manager" = 1464513335;
   	};
  };
}
