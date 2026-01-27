return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
      },
      previewers = {
        git_diff = {
          -- ensure the default tool is used instead of the customized one (difft)
          cmd_deleted = "git diff --no-ext-diff --color HEAD --",
          cmd_modified = "git diff --no-ext-diff --color HEAD",
          cmd_untracked = "git diff --no-ext-diff --color --no-index /dev/null",
        },
      },
    },
  },
  {
    "nvim-mini/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
}
