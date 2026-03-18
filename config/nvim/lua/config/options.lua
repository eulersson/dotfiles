-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.g.autoformat = false
vim.o.exrc = true -- allow local .nvim.lua or .vimrc
vim.o.secure = true -- secure mode: disables unsafe commands in local configs
vim.g.root_spec = { "cwd" }

-- MDX support: register filetype early (before files are loaded, unlike VeryLazy)
-- and treat it like markdown for symbol filtering (outline) and treesitter.
vim.filetype.add({ extension = { mdx = "markdown.mdx" } })
vim.treesitter.language.register("markdown", "markdown.mdx")
