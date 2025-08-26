{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      lg = "lazygit";
      ydev = "yarn dev";
      bdev = "bun dev";
      nprdev = "npm run dev";
      zl = "zellij";
      cd = "z";
      devsh = "devenv shell";
      devup = "devenv up";
      devgc = "devenv gc";
      n = "nvim";
      cnix = "cleanup_nix"; # quick alias for the function below
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "fzf"
        "zoxide"
        "sudo"
        "kubectl"
        "kitty"
        "you-should-use"
      ];
      custom = "${pkgs.runCommand "oh-my-zsh-custom" {} ''
        mkdir -p $out/plugins
        ln -sf ${pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "master";
          sha256 = "XbTZpyUIpALsVezqnIfz7sV26hMi8z+2dW0mL2QbVIE=";
        }} $out/plugins/you-should-use
      ''}";
      theme = "minimal";
    };

    initContent = ''
      # =============================================================================
      # HELPER FUNCTIONS
      # =============================================================================
      
      reload_darwin() {
        cd ~/.config/nix-darwin
        sudo darwin-rebuild switch --flake ".#sahrulramdan"
      }

      app_id() {
        osascript -e "id of app \"$1\""
      }

      merge_kubeconfigs() {
        if [[ -d ~/.kube/configs ]]; then
          echo "Merging kubectl configurations..."
          mkdir -p ~/.kube/merged
          
          local configs
          configs=$(ls ~/.kube/configs/* 2>/dev/null | tr '\n' ':' | sed 's/:$//')
          
          if [[ -n "$configs" ]]; then
            KUBECONFIG="$configs" kubectl config view --merge --flatten > ~/.kube/merged/config 2>/dev/null || {
              echo "Warning: Failed to merge kubectl configs"
              return 1
            }
            export KUBECONFIG=~/.kube/merged/config
          else
            echo "No kubectl configs found in ~/.kube/configs/"
          fi
        fi
      }

      # =============================================================================
      # ENVIRONMENT SETUP
      # =============================================================================
      
      # Merge kubectl configurations on shell startup
      merge_kubeconfigs
      
      # Development environment variables
      export NVIM_APPNAME="nvim-J4de"
      export GOPATH=$HOME/go
      export PATH=$PATH:$GOPATH/bin

      # =============================================================================
      # CLEANUP FUNCTIONS
      # =============================================================================
      
      # Comprehensive Nix cleanup: HM expire + nix-darwin prune + devenv gc + GC + optimise
      # Usage:
      #   cleanup_nix            # keep last 5 HM generations (default)
      #   cleanup_nix 7d         # expire HM gens older than 7 days
      #   cleanup_nix 10         # keep last 10 HM generations
      cleanup_nix() {
        set -euo pipefail

        # argument controls HM expiry: number = keep last N, ends with 'd' = older-than days
        local hm_arg="''${1:-5}"

        echo "==> Expiring Home Manager generations (arg: ''${hm_arg})"
        if [[ "$hm_arg" =~ ^[0-9]+$ || "$hm_arg" =~ ^[0-9]+d$ ]]; then
          nix run nixpkgs#home-manager -- expire-generations "$hm_arg" || echo "   (HM expire skipped/failed)"
        else
          echo "   Invalid arg ''$hm_arg'. Use a number (keep N) or Nd (older than N days). Skipping HM expire."
        fi

        echo "==> Trimming nix-darwin system generations (keeping current & needed)"
        sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old || echo "   (system prune skipped/failed)"

        echo "==> Cleaning pinned devenv shells under ~/code"
        if command -v fd >/dev/null 2>&1; then
          fd -H -t d ".devenv/gc$" "$HOME/code" -x sh -c '
            set -e
            repo_dir="$(dirname "{}")"
            echo "   devenv gc in: $repo_dir"
            cd "$repo_dir" && devenv gc || true
          ' sh
        else
          # fallback with find
          find "$HOME/code" -type d -path "*/.devenv/gc" -print0 2>/dev/null | while IFS= read -r -d "" d; do
            repo_dir="$(dirname "$d")"
            echo "   devenv gc in: $repo_dir"
            (cd "$repo_dir" && devenv gc) || true
          done
        fi

        echo "==> nix-collect-garbage -d"
        sudo nix-collect-garbage -d || echo "   (GC failed?)"

        echo "==> nix store optimise (dedupe)"
        # use root's HOME to avoid HOME ownership warning under sudo
        sudo -H nix store optimise || echo "   (optimise failed?)"

        echo "==> Done. Current /nix/store usage:"
        du -sh /nix/store 2>/dev/null || true
      }
    '';
  };
}
