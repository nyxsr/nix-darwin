{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      lg = "lazygit";
      ydev = "yarn dev";
      bdev = "bun dev";
      nprdev = "npm run dev";
      zl = "zellij";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "fzf" "you-should-use" ];
      theme = "robbyrussell";
    };
  };
}
