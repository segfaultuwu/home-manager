{ config, pkgs, ... }:

{
  programs.btop.enable = true;
  programs.bat.enable = true;
  programs.lazygit.enable = true;

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
