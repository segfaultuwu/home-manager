{ config, pkgs, ... }:

{
  imports = [
    ./modules/catppuccin.nix
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/editors.nix
    ./modules/terminals.nix
    ./modules/cli.nix
    ./modules/rofi.nix
    ./modules/dunst.nix
    ./modules/waybar.nix
    # ./modules/hyprland.nix # fuck this shit
    ./modules/noctalia.nix
    ./modules/gtk.nix
    ./modules/nvim.nix
    ./modules/spicetify.nix
  ];

  home.username = "segfault";
  home.homeDirectory = "/home/segfault";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
