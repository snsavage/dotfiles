return function(use)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use "christoomey/vim-tmux-navigator"
  use "fatih/vim-go"
end
