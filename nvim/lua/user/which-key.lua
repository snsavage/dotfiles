local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {}

wk.register({
  e = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
  -- f = {
  --   name = "Telescope",
  -- },
  n = {
    name = "+Reset",
    b = { "<cmd>%bd | e#<cr>", "Buffers" },
    l = { "<cmd>nohlsearch<cr>", "Search Highlight"},
  },
  x = {
    name = "+Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle"},
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnosticsle"},
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix"},
    l = { "<cmd>TroubleToggle loclist<cr>", "Location List"},
  },
  m = {
    name = "+Make",
    t = { "<cmd>make! test<cr>", "Make Test"},
  },
}, { prefix = "<leader>" })

wk.register({
  f = {
    name = "Telescope",
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep"},
    b = { "<cmd>Telescope buffers<cr>", "Buffers"},
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags"},
    f = { "<cmd>Telescope registers<cr>", "Registers"},
  },
})
