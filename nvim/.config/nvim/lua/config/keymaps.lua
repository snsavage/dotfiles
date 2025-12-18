-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy relative path to system clipboard
vim.keymap.set("n", "<leader>rp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  print("Copied relative path: " .. path)
end, { desc = "Copy relative path to clipboard" })

-- Copy absolute path to system clipboard
vim.keymap.set("n", "<leader>ap", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied absolute path: " .. path)
end, { desc = "Copy absolute path to clipboard" })

vim.keymap.set("v", "<leader>gu", function()
  -- 1. Get the remote URL and clean it up
  local remote = vim.fn.system("git config --get remote.origin.url"):gsub("\n", "")
  if remote == "" then
    print("Not a git repo")
    return
  end

  -- Convert SSH or Git protocol to HTTPS
  remote = remote:gsub("git@github.com:", "https://github.com/")
  remote = remote:gsub("%.git$", "")

  -- 2. Get the current branch or commit
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")

  -- 3. Get the relative file path
  local file_path = vim.fn.expand("%")

  -- 4. Get visual selection line numbers
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  -- Ensure lines are in order if selected bottom-to-top
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- 5. Construct the URL
  local url = string.format("%s/blob/%s/%s#L%d-L%d", remote, branch, file_path, start_line, end_line)

  -- 6. Copy to clipboard and notify
  vim.fn.setreg("+", url)
  print("Copied Permalink: " .. url)
end, { desc = "Copy GitHub permalink for selection" })
