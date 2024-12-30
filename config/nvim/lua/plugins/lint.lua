return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- Ignore Rule: MD013 Line length
          args = { "--disable", "MD013", "--" },
        },
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("$HOME") .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
