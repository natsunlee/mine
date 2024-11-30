{ pkgs, ... }:

{
  home.packages = with pkgs; [ bartender ];
}
