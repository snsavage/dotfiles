-- Supplies the TmuxNavigate* commands. The <C-h/j/k/l> mappings themselves are
-- set in lua/config/keymaps.lua, which LazyVim loads after its own defaults —
-- setting them here would lose to LazyVim's "Go to <dir> Window" maps, which
-- land on the VeryLazy event after plugin config functions have already run.
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  init = function()
    -- config/keymaps.lua owns the chords; keep the plugin from claiming them.
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
