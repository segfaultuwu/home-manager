{
  config,
  pkgs,
  lib,
  ...
}:

{
  catppuccin = {
    enable = true;

    flavor = lib.mkDefault "mocha";
    accent = lib.mkDefault "mauve";

    cursors = {
      enable = true;
      flavor = lib.mkDefault "mocha";
      accent = lib.mkDefault "mauve";
    };

    # CLI
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fzf.enable = true;
    lazygit.enable = true;
    gitui.enable = true;

    # Shell
    starship.enable = true;
    zsh-syntax-highlighting.enable = true;

    # Editors
    helix.enable = true;
    zed.enable = true;
    vscode.profiles.default.enable = true;

    # Terminals
    kitty.enable = true;
    alacritty.enable = true;

    # UI/apps
    dunst.enable = true;
    rofi.enable = true;
    mpv.enable = true;
  };
}
