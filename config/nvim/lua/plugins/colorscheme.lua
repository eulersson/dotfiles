return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      -- Bold and italic are hard to tell apart from plain text in the
      -- terminal, so give them a color as well.
      on_highlights = function(hl, c)
        hl["@markup.strong"] = { fg = c.magenta, bold = true }
        hl["@markup.italic"] = { fg = c.blue, italic = true }
      end,
    },
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      -- dark-notify changes the background option and tokyonight automatically reacts
      require("dark_notify").run()
      -- Re-sync on focus regain (e.g. tmux session switch) in case the
      -- subprocess missed an event. Requires `focus-events on` in tmux.
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          require("dark_notify").update()
        end,
      })
    end,
  },
}
