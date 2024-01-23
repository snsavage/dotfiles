local ok, trouble = pcall(require, "trouble")
if not ok then
  return
end

trouble.setup{
  mode = "workspace_diagnostics",
  use_diagnostic_signs = false
}
