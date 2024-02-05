return {
  "nvim-neo-tree/neo-tree.nvim",
  config = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        always_show = {
          ".envrc",
          ".envrc-sample",
        },
      },
    },
  },
}
