local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append("nbsp:⋅")
vim.opt.listchars:append("trail:⋅")

indent.setup {
  space_char_blankline = " ",
  show_current_context = false,
  show_current_context_start = true,
}

