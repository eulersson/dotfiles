return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      mdx_analyzer = {
        filetypes = { "mdx", "markdown.mdx" },
      },
      -- Point pyright at the project's uv env (`.venv`), so it resolves the
      -- packages installed there without activating it first. An env
      -- activated in the shell still wins, as pyright then finds it on PATH.
      pyright = {
        before_init = function(_, config)
          local python = config.root_dir and config.root_dir .. "/.venv/bin/python"
          if vim.env.VIRTUAL_ENV or not python or vim.fn.executable(python) == 0 then
            return
          end
          config.settings.python = config.settings.python or {}
          config.settings.python.pythonPath = python
        end,
      },
    },
  },
}
