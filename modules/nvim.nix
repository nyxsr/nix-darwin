{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Install plugins
    plugins = with pkgs.vimPlugins; [
      # Core plugins
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      # UI enhancements
      tokyonight-nvim
      lualine-nvim
      nvim-web-devicons

      # Editor enhancements
      which-key-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      # Git integration
      vim-fugitive
      gitsigns-nvim
    ];

    # Extra packages to make available to Neovim
    extraPackages = with pkgs; [
      # Language servers
      lua-language-server
      pyright
      rust-analyzer
      nodePackages.typescript-language-server
      gopls
    ];

    # Custom Neovim configuration in Lua
    extraLuaConfig = ''
      -- General settings
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.mouse = 'a'
      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.opt.hlsearch = false
      vim.opt.wrap = false
      vim.opt.breakindent = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '

      -- Color scheme setup
      vim.opt.termguicolors = true
      vim.cmd[[colorscheme tokyonight]]

      -- Plugin configurations
      -- LSP setup
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup language servers
      local servers = {'lua_ls', 'pyright', 'tsserver', 'rust_analyzer', 'gopls'}
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end

      -- Keybindings for LSP
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })

      -- Completion setup
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- Treesitter setup
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })

      -- Telescope setup
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      telescope.load_extension('fzf')

      -- Telescope keybindings
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help tags' })

      -- Which-key setup
      require('which-key').setup()

      -- Lualine setup
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
        }
      })

        -- Gitsigns setup
        require('gitsigns').setup()
    '';
  };
}
