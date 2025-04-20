{
  description = "sahrulramdan nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager = {
    	url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
          url = "github:homebrew/homebrew-core";
          flake = false;
    };
    homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
    };
    homebrew-bundle = {
        url = "github:homebrew/homebrew-bundle";
        flake = false;
    };
    homebrew-services = {
        url = "github:homebrew/homebrew-services";
        flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, homebrew-services, home-manager }:
  let
    configuration = { pkgs, config, inputs, ... }: {
      environment.variables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
      };

      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowBroken = false;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."sahrulramdan" = nix-darwin.lib.darwinSystem {
      modules = [
      { nix.enable = false; }
        configuration
        ./darwin/base-packages.nix
        ./darwin/fonts.nix
        ./darwin/system.nix
        ./darwin/homebrew.nix
        mac-app-util.darwinModules.default
        nix-homebrew.darwinModules.nix-homebrew
       	home-manager.darwinModules.home-manager
       	{
      		home-manager.useGlobalPkgs = true;
      		home-manager.useUserPackages = true;
      		home-manager.users.sahrulramdan = import ./home.nix;
       	}
        {
            nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "sahrulramdan";

            # Optional: Declarative tap management
            taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
                "homebrew/homebrew-services" = homebrew-services;
                "homebrew/cask" = homebrew-cask;
            };

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = true;

            # Automatically migrate existing Homebrew installations
            # autoMigrate = true;
            };
        }
      ];
    };
  };
}
