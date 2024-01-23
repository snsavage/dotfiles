local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>w", ":w<cr>", opts)            -- Write file

keymap("n", "<leader>-", ":wincmd _<cr>:wincmd |<cr>", opts)
keymap("n", "<leader>=", ":wincmd =<cr>", opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

