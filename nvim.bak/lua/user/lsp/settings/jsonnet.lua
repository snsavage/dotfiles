local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

lspconfig.jsonnet_ls.setup{
	-- ext_vars = {
	-- 	foo = 'bar',
	-- },
	-- formatting = {
	-- 	-- default values
	-- 	Indent              = 2,
	-- 	MaxBlankLines       = 2,
	-- 	StringStyle         = 'single',
	-- 	CommentStyle        = 'slash',
	-- 	PrettyFieldNames    = true,
	-- 	PadArrays           = false,
	-- 	PadObjects          = true,
	-- 	SortImports         = true,
	-- 	UseImplicitPlus     = true,
	-- 	StripEverything     = false,
	-- 	StripComments       = false,
	-- 	StripAllButComments = false,
	-- },
}
