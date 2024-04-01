return {
  "leoluz/nvim-dap-go",
  opts = {
    delve = {
      initialize_timeout_sec = 30,
    },
    dap_configurations = {
      {
        type = "go",
        name = "Lotus: API Server",
        request = "launch",
        program = "./cmd/server/",
      },
      {
        type = "go",
        name = "Lotus: Webhook Server",
        request = "launch",
        program = "./cmd/webhook-server/",
      },
      {
        type = "go",
        name = "Lotus: Worker",
        request = "launch",
        program = "./cmd/worker",
      },
      {
        type = "go",
        name = "Lotus: Repo Server",
        request = "launch",
        program = "./cmd/repo-server",
      },
    },
  },
}
