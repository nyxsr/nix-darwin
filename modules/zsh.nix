{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      lg = "lazygit";
      ydev = "yarn dev";
      bdev = "bun dev";
      nprdev = "npm run dev";
      zl = "zellij";
      cd = "z";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "fzf" "zoxide" "z" "thefuck" "sudo" "kubectl" "kitty" ];
      theme = "minimal";
    };

initExtra = ''
  reload_darwin() {
    cd ~/.config/nix-darwin
    darwin-rebuild switch --flake ".#sahrulramdan"
  }

  app_id() {
    osascript -e "id of app \"$1\""
  }

  export KUBECONFIG=/Users/sahrulramdan/Downloads/config-no-tunnel.backup.yaml
'';
  };
}
