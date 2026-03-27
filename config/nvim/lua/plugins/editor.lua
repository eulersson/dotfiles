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
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>gE",
        function()
          local buf_dir = vim.fn.expand("%:p:h")
          local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(buf_dir) .. " rev-parse --show-toplevel")[1]
          if vim.v.shell_error == 0 and git_root then
            require("neo-tree.command").execute({ source = "git_status", toggle = true, dir = git_root })
          else
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
          end
        end,
        desc = "Git Explorer (current file's git root)",
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    opts = {
      providers = {
        priority = { "mdx", "markdown", "lsp", "coc", "norg", "man" },
      },
      symbols = {
        filter = {
          ["markdown.mdx"] = false, -- show all symbol kinds (same as markdown)
        },
      },
    },
  },
}
