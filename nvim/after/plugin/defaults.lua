print "Hello from defaults.lua"

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
