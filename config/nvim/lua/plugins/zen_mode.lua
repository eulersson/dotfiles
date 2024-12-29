return {
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    event = "VeryLazy",
    opts = {
      window = {
        backdrop = 0.8,
        width = 90,
        height = 0.6,
        options = {
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = true, -- disables the ruler text in the cmd line area
          showcmd = true, -- disables the command in the last line of the screen
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true },
        kitty = {
          enabled = true,
          font = "+7",
        },
      },
    },
  },
}
