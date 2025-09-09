return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = LazyVim.config.icons

    opts.options = opts.options or {}
    opts.options.theme = "tokyonight"

    opts.sections = opts.sections or {}
    opts.sections.lualine_b = {
      {
        "branch",
        fmt = function(str)
          if #str > 10 then
            return str:sub(1, 10) .. "..."
          end
          return str
        end,
      },
      "diff",
    }
    opts.sections.lualine_c = {
      LazyVim.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path() },
    }

    return opts
  end,
}
