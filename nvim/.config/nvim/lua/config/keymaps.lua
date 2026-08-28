-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Seamless <C-h/j/k/l> between nvim splits and the surrounding multiplexer.
--
-- This has to live HERE, not in the vim-tmux-navigator plugin spec. LazyVim
-- sets its own "Go to <dir> Window" maps on the VeryLazy event, which fires
-- after plugin config functions run — so mappings set from a spec get silently
-- overwritten and you get a plain <C-w>h with no edge handoff. LazyVim loads
-- this file after its own defaults, so these win.
--
-- The herdr half is installed by `make herdr`; its path carries a content hash,
-- so glob rather than hardcode. Without it we fall back to plain tmux
-- navigation, keeping a tmux-only machine working.
local herdr_nav = vim.fn.glob(
  vim.fn.expand("~/.config/herdr/plugins/github/vim-herdr-navigation-*/editor/nvim.lua"),
  false,
  true
)[1]

if herdr_nav then
  dofile(herdr_nav)
else
  for key, dir in pairs({ h = "Left", j = "Down", k = "Up", l = "Right" }) do
    vim.keymap.set("n", "<C-" .. key .. ">", "<cmd>TmuxNavigate" .. dir .. "<cr>", {
      silent = true,
      desc = "Navigate " .. dir:lower() .. " (vim/tmux)",
    })
  end
end

-- Copy repo-relative path to system clipboard
vim.keymap.set("n", "<leader>rp", function()
  local path = vim.fn.system("git ls-files --full-name " .. vim.fn.shellescape(vim.fn.expand("%:p"))):gsub("\n", "")
  if path == "" then
    print("File not tracked by git")
  else
    vim.fn.setreg("+", path)
    print("Copied repo-relative path: " .. path)
  end
end, { desc = "Copy repo-relative path to clipboard" })

-- Copy absolute path to system clipboard
vim.keymap.set("n", "<leader>ap", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied absolute path: " .. path)
end, { desc = "Copy absolute path to clipboard" })

-- Helper function to build GitHub URLs
local function build_github_url(start_line, end_line)
  local remote = vim.fn.system("git config --get remote.origin.url"):gsub("\n", "")
  if remote == "" then
    print("Not a git repo")
    return nil
  end

  remote = remote:gsub("git@github.com:", "https://github.com/"):gsub("%.git$", "")
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  local file_path =
    vim.fn.system("git ls-files --full-name " .. vim.fn.shellescape(vim.fn.expand("%:p"))):gsub("\n", "")

  if file_path == "" then
    print("File not tracked by git")
    return nil
  end

  local url = string.format("%s/blob/%s/%s", remote, branch, file_path)
  if start_line and end_line then
    url = url .. string.format("#L%d-L%d", start_line, end_line)
  end
  return url
end

-- Copy GitHub URL for current file
vim.keymap.set("n", "<leader>gu", function()
  local url = build_github_url()
  if url then
    vim.fn.setreg("+", url)
    print("Copied GitHub URL: " .. url)
  end
end, { desc = "Copy GitHub URL for current file" })

-- Copy GitHub permalink for selected lines
vim.keymap.set("v", "<leader>gu", function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local url = build_github_url(start_line, end_line)
  if url then
    vim.fn.setreg("+", url)
    print("Copied GitHub permalink: " .. url)
  end
end, { desc = "Copy GitHub permalink for selection" })
