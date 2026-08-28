return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    opts = opts or {}
    opts.grep = opts.grep or {}
    opts.grep.rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --glob=!.git/ --glob=!vendor/ -e"
    return opts
  end,
}
