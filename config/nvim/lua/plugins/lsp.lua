return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      mdx_analyzer = {
        filetypes = { "mdx", "markdown.mdx" },
      },
    },
  },
}
