return {
  {
    "fzf-lua",
    opts = {
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
}
