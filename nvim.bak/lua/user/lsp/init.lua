local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local util_ok, util = pcall(require, "lspconfigi/util")
if not util_ok then
  return
end


require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.treesitter"
require "user.lsp.settings.jsonnet"
