{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      editor = {
        line-number = "relative";
        mouse = true;
        bufferline = "multiple";
        color-modes = true;
        true-color = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
        };
      };
    };
  };
}
