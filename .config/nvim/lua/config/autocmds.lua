-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Go files editor settings.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.go", "go" },
  callback = function()
    vim.opt_local.expandtab = false
  end,
})
