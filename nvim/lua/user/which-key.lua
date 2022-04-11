local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {}

-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

wk.register({
  e = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
  -- f = {
  --   name = "Telescope",
  -- },
  n = {
    name = "Reset",
    b = { "<cmd>%bd | e#<cr>", "Buffers" },
    l = { "<cmd>nohlsearch<cr>", "Search Highlight"},
  },
  x = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle"},
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnosticsle"},
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix"},
    l = { "<cmd>TroubleToggle loclist<cr>", "Location List"},
 }
}, { prefix = "<leader>" })
