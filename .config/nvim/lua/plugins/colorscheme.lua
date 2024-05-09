return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      -- dark-notify changes the background option and tokyonight automatically reacts
      require("dark_notify").run()
    end,
  },
}
