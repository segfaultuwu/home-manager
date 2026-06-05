{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    extraPackages = with pkgs; [
      nil
      nixfmt

      lua-language-server
      stylua

      gopls
      gofumpt
      gotools

      typescript-language-server
      vscode-langservers-extracted
      emmet-language-server
      prettier

      pyright
      ruff

      clang-tools

      bash-language-server
      shfmt

      ripgrep
      fd
      tree-sitter
    ];

    plugins = with pkgs.vimPlugins; [
      # UI
      catppuccin-nvim
      lualine-nvim
      bufferline-nvim
      nvim-web-devicons
      noice-nvim
      nui-nvim
      dressing-nvim
      indent-blankline-nvim
      dashboard-nvim

      # Navigation
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      nvim-tree-lua
      which-key-nvim
      oil-nvim

      # Treesitter
      nvim-treesitter
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.tsx
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.markdown_inline

      # LSP / completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip

      # Formatting
      conform-nvim

      # Git
      gitsigns-nvim
      diffview-nvim
      vim-fugitive

      # QoL
      comment-nvim
      nvim-autopairs
      todo-comments-nvim
      trouble-nvim
      flash-nvim
      presence-nvim
    ];

    extraLuaConfig = builtins.readFile ../nvim/init.lua;
  };

  xdg.configFile."nvim/lua".source = ../nvim/lua;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
