{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Lepsza historia
    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      # ls / files
      ls = "eza --icons --group-directories-first";
      ll = "eza -lah --icons --git --group-directories-first";
      la = "eza -la --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons --group-directories-first";
      lta = "eza --tree --level=3 --icons --git --group-directories-first";

      # better defaults
      cat = "bat";
      grep = "rg";
      find = "fd";
      du = "dust";
      df = "duf";
      top = "btop";
      ps = "procs";

      # git
      g = "git";
      gs = "git status --short";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate --all";
      gd = "git diff";

      # nixos
      rebuild = "sudo nixos-rebuild switch";
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      nrb = "sudo nixos-rebuild boot";
      hms = "home-manager switch";
      cleanup = "sudo nix-collect-garbage -d";
      optimise = "nix-store --optimise";

      # quality of life
      mkdir = "mkdir -p";
      please = "sudo";
      c = "clear";
      path = "echo $PATH | tr ':' '\\n'";
    };

    initContent = ''
      export PATH="$HOME/.local/bin:$PATH"
      # fzf helpers

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      # Ctrl+Backspace / Ctrl+Delete
      bindkey '^H' backward-kill-word
      bindkey '^[[3;5~' kill-word

      # Better completion style
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu select
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

      # Nice prompt spacing
      precmd() {
        print -Pn ""
      }
    '';
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
  };

  programs.bat = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };
}
