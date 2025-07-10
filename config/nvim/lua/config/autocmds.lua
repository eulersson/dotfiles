-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Go files editor settings.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.go", "go" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Automatically hard-wrap markdown.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown*",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("t")
  end,
})
--ReloadAll: Reloads all open buffers in Neovim.
vim.api.nvim_create_user_command("ReloadAll", function()
  vim.cmd("bufdo checktime")
end, {})
