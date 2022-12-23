-- Helpers
local opts = { noremap = true, silent = true } -- Keymap options
local keymap = vim.api.nvim_set_keymap -- Shorten keymap

vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.textwidth = 80

-- Keymaps
keymap("n", "<leader>w", ":w<cr>", opts) -- Write file
keymap("n", "<leader>-", ":wincmd _<cr>:wincmd |<cr>", opts)
keymap("n", "<leader>=", ":wincmd =<cr>", opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

require("nvim-tree").setup({
  actions = {
    open_file = {
      resize_window = true
    }
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    custom = {".git"}
  },
})

-- Autocommands
local api = vim.api
local augroup = api.nvim_create_augroup("Markdown", { clear = true })

-- api.nvim_create_autocmd("FileType", {
--   group = augroup,
--   pattern = "markdown",
--   command = "set wrap"
-- })

api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  command = "set linebreak nobreakindent textwidth=0 wrap"
})
