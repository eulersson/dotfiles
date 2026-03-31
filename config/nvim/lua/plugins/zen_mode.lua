return {
  -- configure Snacks zen mode (triggered by <leader>uz)
  {
    "folke/snacks.nvim",
    opts = {
      zen = {
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
        },
        win = {
          style = "zen",
          width = 120,
          wo = {
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
          },
        },
      },
    },
  },
}
