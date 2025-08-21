return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            format = {
              singleQuote = true,
            },
          },
        },
      },
    },
  },
}
