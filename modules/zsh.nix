{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -lah --icons --git";
      la = "eza -la --icons";
      cat = "bat";
      grep = "rg";
      cd = "z";

      rebuild = "sudo nixos-rebuild switch";
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      hms = "home-manager switch";
      cleanup = "sudo nix-collect-garbage -d";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
