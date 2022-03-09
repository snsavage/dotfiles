local status_ok, installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

installer.on_server_ready(function(server)
  local opts = {}

  server:setup(opts)
end)

