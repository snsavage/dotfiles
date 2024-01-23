return function(use)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use "christoomey/vim-tmux-navigator"
  use "editorconfig/editorconfig-vim"
  use "fatih/vim-go"
  use "folke/trouble.nvim"

  use({
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  })

  use "towolf/vim-helm"

  local configs = require('lspconfig.configs')
  local lspconfig = require('lspconfig')
  local util = require('lspconfig.util')

  if not configs.helm_ls then
    configs.helm_ls = {
      default_config = {
        cmd = {"helm_ls", "serve"},
        filetypes = {'helm'},
        root_dir = function(fname)
          return util.root_pattern('Chart.yaml')(fname)
        end,
      },
    }
  end

  lspconfig.helm_ls.setup {
    filetypes = {"helm"},
    cmd = {"helm_ls", "serve"},
  }
end
