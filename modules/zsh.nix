{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "fzf" ];
      theme = "robbyrussell";
    };

    initExtra = '''';
  };
}
