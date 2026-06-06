{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal / apps
    kitty
    floorp
    pcmanfm

    # launcher / clipboard / screenshots
    rofi-wayland
    wl-clipboard
    cliphist
    hyprshot

    # tray / system applets
    networkmanagerapplet
    blueman

    # media / volume / brightness
    pamixer
    brightnessctl
    playerctl

    # useful wayland tools
    grim
    slurp
    jq
  ];

  xdg.configFile."hypr/hyprland.lua".source = ../hypr/hyprland.lua;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      source = [
        "~/.config/hypr/hyprland.lua"
      ];
    };
  };

  systemd.user.services.noctalia-shell = {
    Unit = {
      Description = "Noctalia Shell";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.noctalia-shell or "noctalia-shell"}";
      Restart = "on-failure";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
