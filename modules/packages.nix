{ config, pkgs, ... }:

{

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    vesktop
    prismlauncher
    bottles
    telegram-desktop
    thunderbird

    nerd-fonts.iosevka

    desktop-file-utils
    direnv
    nix-direnv
    bun

    gleam
    crystal
    shards
    crystalline

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

    # music
    lmms
    audacity
    ardour
    qpwgraph

    # Catppuccin GTK
    catppuccin-gtk
    papirus-icon-theme
    nixd
    rust-analyzer
  ];
}
