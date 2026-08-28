return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "templ" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "templ" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
        html = { filetypes = { "html", "templ" } },
        htmx = { filetypes = { "html", "templ" } },
        tailwindcss = { filetypes = { "templ", "html" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { templ = { "templ" } },
    },
  },
}
