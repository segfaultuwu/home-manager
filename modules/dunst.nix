{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 360;
        height = 300;
        offset = "16x40";
        origin = "top-right";
        transparency = 8;
        frame_width = 2;
        corner_radius = 12;
        font = "JetBrainsMono Nerd Font 10";
      };
    };
  };
}
