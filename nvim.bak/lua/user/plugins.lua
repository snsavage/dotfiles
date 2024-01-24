local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)

  -- Let Packer manager itself
  use "wbthomason/packer.nvim"

  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Misc Plugins
  use "altercation/vim-colors-solarized"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tpope/vim-repeat"
  use "christoomey/vim-tmux-navigator"
  use "editorconfig/editorconfig-vim"
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- use { "fatih/vim-go", run =':GoUpdateBinaries' }

  -- NVim Plugings
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  -- WhichKey
  use "folke/which-key.nvim"

  -- Lsp Config
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- cmp Plugins
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Indent Lines
  use "lukas-reineke/indent-blankline.nvim"

  use 'folke/trouble.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "jose-elias-alvarez/null-ls.nvim"

  -- Language Specific
  use 'hashivim/vim-terraform'
  use 'google/vim-jsonnet'
  vim.g['jsonnet_fmt_on_save'] = 0
  use 'towolf/vim-helm'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)