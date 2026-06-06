{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.noctalia = {
    enable = true;
  };

  home.packages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."noctalia/config.toml".source = ../configs/noctalia/config.toml;
}
