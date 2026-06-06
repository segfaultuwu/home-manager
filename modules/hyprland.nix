{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    jq
  ];

  xdg.configFile."hypr/hyprland.lua".source = ../configs/hypr/hyprland.lua;

  wayland.windowManager.hyprland = {
    enable = true;
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
