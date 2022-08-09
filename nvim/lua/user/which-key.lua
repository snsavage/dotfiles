local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {}

wk.register({
  e = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
  h = {
    name = "+GitSigns",
    s = {"<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk"},
    r = {"<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk"},
    S = {"<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer"},
    u = {"<cmd>Gitsigns undo_stage_buffer<CR>", "Undo Stage Buffer"},
    R = {"<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer"},
    p = {"<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk"},
    b = {'<cmd>lua require"gitsigns".blame_line{full=true}<CR>', "Blame Line"},
  },
  m = {
    name = "+Make",
    t = { "<cmd>make! test<cr>", "Make Test"},
  },
  n = {
    name = "+Reset",
    b = { "<cmd>%bd | e#<cr>", "Buffers" },
    l = { "<cmd>nohlsearch<cr>", "Search Highlight"},
  },
  t = {
    name = "+Toggle",
    b = {"<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame"},
  },
  x = {
    name = "+Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle"},
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnosticsle"},
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix"},
    l = { "<cmd>TroubleToggle loclist<cr>", "Location List"},
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

