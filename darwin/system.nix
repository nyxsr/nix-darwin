{ config, pkgs, lib, ... }: {
  system = {
    primaryUser = "sahrulramdan";
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
        _HIHideMenuBar = true;
      };
      dock = {
       	  appswitcher-all-displays = true;
         	autohide = true;
         	autohide-delay = 0.0;
         	autohide-time-modifier = 0.15;
         	dashboard-in-overlay = false;
         	enable-spring-load-actions-on-all-items = false;
         	expose-animation-duration = 0.2;
         	expose-group-apps = false;
         	launchanim = true;
         	mineffect = "genie";
         	minimize-to-application = false;
         	mouse-over-hilite-stack = true;
         	magnification = false;
         	mru-spaces = false;
         	orientation = "left";
         	show-process-indicators = true;
         	show-recents = false;
         	showhidden = true;
         	static-only = false;
         	tilesize = 48;
         	wvous-bl-corner = 1;
         	wvous-br-corner = 1;
         	wvous-tl-corner = 1;
         	wvous-tr-corner = 1;
         	persistent-apps = [
             	"/Applications/Opera.app"
             	"/System/Applications/Calendar.app"
             	"/Applications/Discord.app"
              "/Applications/Ghostty.app"
              "/Applications/Obsidian.app"
             	"/System/Applications/System Settings.app"
             	"/Applications/Whatsapp.app"
         	];
     	};
      finder = {
        FXPreferredViewStyle = "clmv";
        AppleShowAllFiles = true;
        AppleShowAllExtensions = false;
        QuitMenuItem = true;
        ShowStatusBar = true;
        ShowPathbar = true;
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

  };
}
