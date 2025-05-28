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
      devsh = "devenv shell";
      devup = "devenv up";
      devgc = "devenv gc";
      n = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "fzf" "zoxide" "z" "thefuck" "sudo" "kubectl" "kitty"];
      custom = "${pkgs.fetchFromGitHub {
            owner = "MichaelAquilina";
            repo = "zsh-you-should-use";
            rev = "master";
            sha256 = "XbTZpyUIpALsVezqnIfz7sV26hMi8z+2dW0mL2QbVIE=";
        }}";
      theme = "minimal";
    };

initContent = ''
  reload_darwin() {
    cd ~/.config/nix-darwin
    sudo darwin-rebuild switch --flake ".#sahrulramdan"
  }

  app_id() {
    osascript -e "id of app \"$1\""
  }

  mkdir -p ~/.kube/merged

  KUBECONFIG=$(ls ~/.kube/configs/* 2>/dev/null | tr '\n' ':' | sed 's/:$//') \
  kubectl config view --merge --flatten > ~/.kube/merged/config

  export KUBECONFIG=~/.kube/merged/config
  export NVIM_APPNAME="nvim-J4de"
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
'';
  };
}
