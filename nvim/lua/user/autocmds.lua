local api = vim.api
local augroup = api.nvim_create_augroup("Markdown", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  command = "set wrap"
})

api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  command = "set linebreak nobreakindent showbreak=… textwidth=0 wrap "
})

-- set nolist
-- set showbreak=â€¦
