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
      # Nix
      nil
      nixfmt

      # Lua
      lua-language-server
      stylua

      # Go
      gopls
      gofumpt
      gotools

      # TypeScript / JS / Web
      typescript-language-server
      vscode-langservers-extracted
      emmet-language-server
      prettier

      # Python
      pyright
      ruff

      # C/C++
      clang-tools

      # Shell
      bash-language-server
      shfmt

      # Generic
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

      # Quality of life
      comment-nvim
      nvim-autopairs
      todo-comments-nvim
      trouble-nvim
      flash-nvim
    ];

    extraLuaConfig = ''
      ------------------------------------------------------------
      -- Core
      ------------------------------------------------------------

      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.mouse = "a"
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"
      vim.opt.cursorline = true
      vim.opt.wrap = false
      vim.opt.scrolloff = 8
      vim.opt.sidescrolloff = 8
      vim.opt.updatetime = 250
      vim.opt.timeoutlen = 400

      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true

      vim.opt.ignorecase = true
      vim.opt.smartcase = true

      vim.opt.swapfile = false
      vim.opt.backup = false
      vim.opt.undofile = true

      vim.opt.splitright = true
      vim.opt.splitbelow = true

      vim.opt.clipboard = "unnamedplus"

      ------------------------------------------------------------
      -- Helpers
      ------------------------------------------------------------

      local function safe_require(name)
        local ok, module = pcall(require, name)
        if not ok then
          vim.notify("missing plugin: " .. name, vim.log.levels.WARN)
          return nil
        end
        return module
      end

      ------------------------------------------------------------
      -- Theme
      ------------------------------------------------------------

      local catppuccin = safe_require("catppuccin")
      if catppuccin then
        catppuccin.setup({
          flavour = "mocha",
          transparent_background = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            telescope = true,
            noice = true,
            which_key = true,
            native_lsp = {
              enabled = true,
            },
          },
        })

        vim.cmd.colorscheme("catppuccin")
      end

      ------------------------------------------------------------
      -- UI
      ------------------------------------------------------------

      local lualine = safe_require("lualine")
      if lualine then
        lualine.setup({
          options = {
            theme = "catppuccin",
            globalstatus = true,
            section_separators = "",
            component_separators = "",
          },
        })
      end

      local bufferline = safe_require("bufferline")
      if bufferline then
        bufferline.setup({
          options = {
            diagnostics = "nvim_lsp",
            separator_style = "thin",
            show_buffer_close_icons = false,
            show_close_icon = false,
          },
        })
      end

      local noice = safe_require("noice")
      if noice then
        noice.setup({
          presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
          },
        })
      end

      local dressing = safe_require("dressing")
      if dressing then
        dressing.setup({})
      end

      ------------------------------------------------------------
      -- File managers
      ------------------------------------------------------------

      local nvim_tree = safe_require("nvim-tree")
      if nvim_tree then
        nvim_tree.setup({
          view = {
            width = 32,
          },
          renderer = {
            group_empty = true,
            icons = {
              show = {
                git = true,
                folder = true,
                file = true,
              },
            },
          },
          filters = {
            dotfiles = false,
          },
        })
      end

      local oil = safe_require("oil")
      if oil then
        oil.setup({
          default_file_explorer = false,
          view_options = {
            show_hidden = true,
          },
        })
      end

      ------------------------------------------------------------
      -- Treesitter
      ------------------------------------------------------------

      local treesitter = safe_require("nvim-treesitter.configs")
      if treesitter then
        treesitter.setup({
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
        })
      end

      ------------------------------------------------------------
      -- Navigation
      ------------------------------------------------------------

      local telescope = safe_require("telescope")
      if telescope then
        telescope.setup({
          defaults = {
            file_ignore_patterns = {
              "node_modules",
              ".git/",
              "dist/",
              "build/",
              "target/",
              ".direnv/",
              "result/",
            },
          },
        })

        pcall(telescope.load_extension, "fzf")
      end

      ------------------------------------------------------------
      -- Quality of life
      ------------------------------------------------------------

      local autopairs = safe_require("nvim-autopairs")
      if autopairs then
        autopairs.setup({})
      end

      local comment = safe_require("Comment")
      if comment then
        comment.setup({})
      end

      local gitsigns = safe_require("gitsigns")
      if gitsigns then
        gitsigns.setup({})
      end

      local todo = safe_require("todo-comments")
      if todo then
        todo.setup({})
      end

      local trouble = safe_require("trouble")
      if trouble then
        trouble.setup({})
      end

      local which_key = safe_require("which-key")
      if which_key then
        which_key.setup({})
      end

      local flash = safe_require("flash")
      if flash then
        flash.setup({})
      end

      ------------------------------------------------------------
      -- Completion
      ------------------------------------------------------------

      local cmp = safe_require("cmp")
      local luasnip = safe_require("luasnip")

      if cmp and luasnip then
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },

          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),

            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          }),

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
          }),
        })
      end

      ------------------------------------------------------------
      -- LSP
      ------------------------------------------------------------

      local lspconfig = safe_require("lspconfig")
      local cmp_lsp = safe_require("cmp_nvim_lsp")

      if lspconfig then
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        if cmp_lsp then
          capabilities = cmp_lsp.default_capabilities(capabilities)
        end

        local servers = {
          nil_ls = {},
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
          gopls = {},
          html = {},
          cssls = {},
          jsonls = {},
          emmet_language_server = {},
          pyright = {},
          ruff = {},
          clangd = {},
          bashls = {},
        }

        -- TypeScript server name changed in lspconfig history.
        if lspconfig.ts_ls then
          servers.ts_ls = {}
        elseif lspconfig.tsserver then
          servers.tsserver = {}
        end

        for name, opts in pairs(servers) do
          if lspconfig[name] then
            opts.capabilities = capabilities
            lspconfig[name].setup(opts)
          end
        end
      end

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      ------------------------------------------------------------
      -- Formatting
      ------------------------------------------------------------

      local conform = safe_require("conform")
      if conform then
        conform.setup({
          formatters_by_ft = {
            nix = { "nixfmt" },
            lua = { "stylua" },
            go = { "gofumpt" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            python = { "ruff_format" },
            sh = { "shfmt" },
          },
        })
      end

      ------------------------------------------------------------
      -- Keymaps
      ------------------------------------------------------------

      local map = vim.keymap.set

      map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
      map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

      map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle tree" })
      map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

      map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })

      map("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git" })
      map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview" })
      map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })

      map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
      map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "TODOs" })

      map("n", "<leader>f", function()
        local c = safe_require("conform")
        if c then
          c.format({ async = true, lsp_fallback = true })
        else
          vim.lsp.buf.format({ async = true })
        end
      end, { desc = "Format file" })

      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      map("n", "gr", vim.lsp.buf.references, { desc = "References" })
      map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

      map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
      map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
      map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

      map("n", "<Esc>", "<cmd>nohlsearch<CR>")
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
