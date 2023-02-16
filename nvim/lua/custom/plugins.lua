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
end
