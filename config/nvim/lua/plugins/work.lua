-- Configuration particular to my work (my job), so they a not my preferences.

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
}
