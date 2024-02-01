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
        args = { "--", "--ip 127.0.0.1", "--port 5000", "--metrics-port 8080" },
      },
    },
  },
}
