return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- Ignore Rule: MD013 Line length
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },
}
