{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    prismlauncher
    bottles
    telegram-desktop
    thunderbird

    onefetch
    tokei
    hyperfine
    procs
    yazi
    zoxide
    atuin

    nil
    nixfmt-rfc-style
    alejandra

    hyprshot
    wl-clipboard
    cliphist
    awww
    pamixer
    pavucontrol
    brightnessctl
    playerctl
    networkmanagerapplet
    blueman
    pcmanfm
    lxqt.lxqt-archiver
    gvfs

    # Catppuccin GTK
    catppuccin-gtk
    papirus-icon-theme	
    nixd
  ];
}
