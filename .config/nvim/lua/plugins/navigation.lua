return {
  -- NOTE: Do not mix kitty layouts and tmux layouts, choose either one or the other.
  {
    "MunsMan/kitty-navigator.nvim",
    build = {
      "cp navigate_kitty.py ~/.config/kitty",
      "cp pass_keys.py ~/.config/kitty",
    },
    keys = {
      {
        "<C-h>",
        function()
          require("kitty-navigator").navigateLeft()
        end,
        desc = "Move left a Split",
        mode = { "n" },
      },
      {
        "<C-j>",
        function()
          require("kitty-navigator").navigateDown()
        end,
        desc = "Move down a Split",
        mode = { "n" },
      },
      {
        "<C-k>",
        function()
          require("kitty-navigator").navigateUp()
        end,
        desc = "Move up a Split",
        mode = { "n" },
      },
      {
        "<C-l>",
        function()
          require("kitty-navigator").navigateRight()
        end,
        desc = "Move right a Split",
        mode = { "n" },
      },
    },
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   enabled = false,
  --   cmd = {
  --     "TmuxNavigateLeft",
  --     "TmuxNavigateDown",
  --     "TmuxNavigateUp",
  --     "TmuxNavigateRight",
  --     "TmuxNavigatePrevious",
  --   },
  --   keys = {
  --     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --   },
  -- },
}
