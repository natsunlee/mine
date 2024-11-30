{ pkgs, ... }:

{
  #home.file = {
  #  ".config/oh-my-posh/unicorn.omp.json".source = ./.config/oh-my-posh/unicorn.omp.json;
  #};

  programs.zsh = {
    shellAliases = {};
    enable = true;
    autosuggestion = {
      enable = true;
    };
    history.ignoreAllDups = true;
    initExtra = ''
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${./.config/oh-my-posh/unicorn.omp.json})"
    '';
  };
}

