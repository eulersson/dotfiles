-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Override resize window using <ctrl> arrow keys to be in steps of 1 instead of 2.
map("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase Window Width" })

-- Live grep with args (so we can exclude or exclude patterns and files).
map(
  "n",
  "<leader>fl",
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "potato " }
)

-- Select all.
map("n", "<C-a>", "gg<S-v>G")
