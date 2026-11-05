-- LazyVim maps <C-h/j/k/l> in terminals to plain window moves, which can't
-- reach tmux panes. Go through vim-tmux-navigator instead, like in normal mode.
-- Floating terminals (lazygit) still get the keys.
local function term_nav(key, direction)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. key .. ">" or vim.schedule(function()
      vim.cmd("TmuxNavigate" .. direction)
    end)
  end
end

return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      auto_insert = false, -- boolean start insert mode when entering the terminal buffer
      auto_close = true, -- close the terminal buffer when the process exits
      win = {
        keys = {
          nav_h = { "<C-h>", term_nav("h", "Left"), desc = "Go to Left Window", expr = true, mode = "t" },
          nav_j = { "<C-j>", term_nav("j", "Down"), desc = "Go to Lower Window", expr = true, mode = "t" },
          nav_k = { "<C-k>", term_nav("k", "Up"), desc = "Go to Upper Window", expr = true, mode = "t" },
          nav_l = { "<C-l>", term_nav("l", "Right"), desc = "Go to Right Window", expr = true, mode = "t" },
        },
      },
    },
  },
}
