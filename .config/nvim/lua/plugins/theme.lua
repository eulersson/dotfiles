return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        light_style = "storm",
        transparent = true,
      })
    end,
    init = function()
      vim.cmd.colorscheme "tokyonight"
    end
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      require('dark_notify').run()
    end
  }
}
