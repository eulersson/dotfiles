return {
  -- Allows including, excluding paths, ignoring files, using globs...
  -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
  -- https://www.reddit.com/r/neovim/comments/1bjs39r/how_to_integrate_livegrepargs_with_lazyvim/
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
        },
      },
    },
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Grep Live Args (root dir)",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
              ["<CR>"] = actions.select_default + actions.center,
            },
          },
        },
        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
              },
            },
          },
        },
      })

      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")
    end,
  },
}
