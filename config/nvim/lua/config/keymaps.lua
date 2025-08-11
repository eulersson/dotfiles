-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Override resize window using <ctrl> <shift> arrow keys to be in steps of 1 instead of 2.
-- Using Ctrl+Shift to avoid conflict with tmux navigation (Ctrl+arrows).
map("n", "<C-S-Up>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
map("n", "<C-S-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease Window Width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase Window Width" })

-- Window width commands (similar to <C-w>| for maximize)
map("n", "<C-w>2", function()
  local width = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(width / 2))
end, { desc = "Set window to half width" })

map("n", "<C-w>3", function()
  local width = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(width / 3))
end, { desc = "Set window to third width" })

map("n", "<C-w>4", function()
  local width = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(width / 4))
end, { desc = "Set window to quarter width" })

-- While writing the arguments of a function it's useful to show the signature again.
map({ "i", "n" }, "<A-M>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Live grep with args (so we can exclude or exclude patterns and files).
map(
  "n",
  "<leader>fl",
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live grep with args" }
)

-- Changes the buffer order in the top bar.
map(
  "n",
  "<A-H>",
  ":BufferLineMovePrev<CR>",
  { desc = "Move Buffer Leftwards In Top Bar", noremap = true, silent = true }
)
map(
  "n",
  "<A-L>",
  ":BufferLineMoveNext<CR>",
  { desc = "Move Buffer Rightwards In Top Bar", noremap = true, silent = true }
)

-- Select all.
map("n", "<C-a>", "gg<S-v>G")

-- Function to copy file path with line number or range
local function copy_file_path_with_line()
  local path = vim.fn.expand("%")
  local start_line, end_line

  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    -- Get visual selection range
    start_line = vim.fn.line("v")
    end_line = vim.fn.line(".")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
  else
    -- Just the current line
    start_line = vim.fn.line(".")
    end_line = start_line
  end

  local full = path .. ":" .. start_line
  if start_line ~= end_line then
    full = full .. "-" .. end_line
  end

  vim.fn.setreg("+", full)
  print("Copied: " .. full)
end

-- Normal mode mapping
map("n", "<leader>ci", copy_file_path_with_line, { desc = "Copy relative path with line number" })

-- Visual mode mapping
map("v", "<leader>ci", copy_file_path_with_line, { desc = "Copy relative path with line range" })

-- Copy diagnostic
map("n", "<leader>cd", function()
  local diagnostics = vim.diagnostic.get()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1

  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.lnum == line then
      vim.fn.setreg("+", diagnostic.message)
      print("Copied diagnostic to clipboard")
      return
    end
  end

  print("No diagnostic on this line")
end, { desc = "Copy diagnostic message to clipboard" })
