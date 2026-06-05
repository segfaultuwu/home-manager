{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.noctalia = {
    enable = true;

    settings = {
      bar = {
        position = "top";
        density = "compact";
      };

      shell = {
        launchAppsAsSystemdServices = true;
      };
    };
  };

  home.packages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
