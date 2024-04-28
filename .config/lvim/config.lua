-- Written from:
--
--   https://github.com/LunarVim/starter.lvim/blob/python-ide/config.lua
--   https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting
--
--
lvim.plugins = {
  "catppuccin/nvim",
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "christoomey/vim-tmux-navigator",
  "mg979/vim-visual-multi",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'pyright', 'black', 'isort', 'ruff', 'prettier', 'debugpy', 'shfmt'
        }
      }
    end
  },
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh",
    config = function()
      require("sniprun").setup({
        -- https://michaelb.github.io/sniprun/sources/README.html#configuration
        display = {
          "Classic",       --# display results in the command-line  area
          "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
          -- "VirtualText",             --# display results as virtual text
          -- "TempFloatingWindow",      --# display results in a floating window
          -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
          -- "Terminal",                --# display results in a vertical split
          -- "TerminalWithCode",        --# display results and code history in a vertical split
          -- "NvimNotify",              --# display with the nvim-notify plugin
          -- "Api"                      --# return output to a programming interface
        }
      })
    end,
  },
  -- TODO: Remove after https://github.com/LunarVim/LunarVim/issues/4242 is resolved.
  "MunifTanjim/exrc.nvim",
  "MunifTanjim/nui.nvim",
  'projekt0n/github-nvim-theme',
  {
    "cormacrelf/dark-notify",
    config = function()
      require('dark_notify').run({
        schemes = {
          dark = "catppuccin-mocha",
          light = {
            colorscheme = "github_light",
            background = "dark"
          },
        }
      })
    end
  },
  {
    'jackMort/ChatGPT.nvim',
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY"
      })
    end

  },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require("lsp_signature").setup()
    end
  }
}

-- NOTE: Theming is handled by the dark-notify plugin.
-- -- Set theme. 
-- -- lvim.colorscheme = "github_light"

-- Automatically install python syntax highlighting.
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- -- Add this on a project's /project-root-folder/.nvim.lua to run pyright within a
-- -- container that you built previously with your libraries and pyright.
-- -- -- Working with remote containers
-- -- -- https://www.reddit.com/r/neovim/comments/y1hryr/comment/iry6c0q/
-- require("lvim.lsp.manager").setup("pyright", {
--   -- TODO: I still haven't figured out yet is how to switch the cmd out on a per project
--   -- basis. I'd like to only use this weird pyright setup in my main dev project, but
--   -- then use regular (Mason installed) pyright outside of docker in general.
--   -- cmd = {
--   --   "docker",
--   --   "exec",
--   --   "-i",
--   --   "anesowa-pyright-dev-container",
--   --   "pyright-langserver",
--   --   "--stdio",
--   -- },
--   single_file_support = true,
--   settings = {
--     pyright = {
--       disableLanguageServices = false,
--       disableOrganizeImports = false
--     },
--     python = {
--       analysis = {
--         autoImportCompletions = true,
--         autoSearchPaths = true,
--         diagnosticMode = "workspace", -- openFilesOnly, workspace
--         typeCheckingMode = "basic",   -- off, basic, strict
--         useLibraryCodeForTypes = true
--       }
--     }
--   },
--   -- before_init = function(params)
--   --   -- LSP spec has a default flag that will cause you some trouble; if an LSP server
--   --   -- can't find its parent's processId, it will shut itself down after a second or so.
--   --   -- You need to tell it to ignore the processId shutdown behaviour (or start your
--   --   -- docker container to share the process space with your host).
--   --   -- https://github.com/lspcontainers/lspcontainers.nvim#process-id
--   --   params.processId = vim.NIL
--   -- end,
-- })

-- Setup formatting.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" },
  { name = "shfmt" },
  { name = "gofmt" },
  {
    name = "prettier",
    args = { "--print-width", "88", "--prose-wrap", "always" },
  },
}

-- Setup linting.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "ruff", filetypes = { "python" } } }

-- Setup debug adapter.
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Setup testing.
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration.
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values.
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = {
  "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method"
}

lvim.builtin.which_key.mappings["dM"] = {
  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP"
}

lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
  "Test Class"
}

lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP"
}

lvim.builtin.which_key.mappings["dS"] = {
  "<cmd>lua require('neotest').summary.toggle()<cr>",
  "Test Summary"
}

-- Binding for switching virtual envs.
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

-- Prevent strange bug within tmux + lvim where pressing ESC followed by j/k would move line up/down.
--   https://github.com/LunarVim/LunarVim/issues/1857#issuecomment-1013641928
--   https://www.reddit.com/r/lunarvim/comments/1334htt/comment/ji90g9v/?utm_source=share&utm_medium=web2x&context=3
--   https://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
--   https://unix.stackexchange.com/a/608179
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.visual_mode["<A-j>"] = false
lvim.keys.visual_mode["<A-k>"] = false

-- Move current line / block with Control-Shift-j/k ala vscode.
lvim.keys.normal_mode["<C-S-Down>"] = "<Esc>:m .+1<CR>"
lvim.keys.normal_mode["<C-S-Up>"] = "<Esc>:m .-2<CR>"
lvim.keys.insert_mode["<C-S-Down>"] = "<Esc>:m .+1<CR>==gi"
lvim.keys.insert_mode["<C-S-Up>"] = "<Esc>:m .-2<CR>==gi"
lvim.keys.visual_mode["<C-S-Down>"] = "<Esc>:m .+1<CR>==gv"
lvim.keys.visual_mode["<C-S-Up>"] = "<Esc>:m .-2<CR>==gv"

-- If you have a transparent terminal you need this otherwise the editor does not respect transparency.
lvim.transparent_window = true

-- Set a vertical line on 88.
vim.opt.colorcolumn = "88"

-- TODO: When Neovim native exrc works with LunarVim, remove this 'MunifTanjim/exrc.nvim'
-- configuration-specific part.

-- Ability to run .exrc, .nvimrc and .nvim.lua on per-project basis.
vim.o.exrc = false
require("exrc").setup({
  files = {
    ".nvim.lua",
    ".nvimrc.lua",
    ".nvimrc",
    ".exrc.lua",
    ".exrc",
  },
})

-- Toggle line diagnostics (the linting errors that show on the same line).
lvim.keys.normal_mode["<S-J>"] = "<CMD>lua vim.diagnostic.open_float()<CR>"
-- TODO: This does not work! How do I set the default! I asked on LunarVim: https://github.com/LunarVim/LunarVim/discussions/4549
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})
lvim.builtin.which_key.mappings["lx"] = {
  function()
    if vim.diagnostic.config().virtual_text then
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
      })
    else
      vim.diagnostic.config({
        virtual_text = true,
      })
    end
  end,
  "Toggle Inline Diagnostics"
}

lvim.builtin.which_key.mappings["ly"] = { "<cmd>:SymbolsOutline<cr>", "Symbols Outline" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>1ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>3ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}

-- Define a function to toggle colorcolumn
  function toggle_transparency()
    if vim.wo.colorcolumn == '88' then
      vim.wo.colorcolumn = ''
      vim.wo.cursorline = false
      lvim.transparent_window = true
    else
      vim.wo.colorcolumn = '88'
      vim.wo.cursorline = true
      lvim.transparent_window = false
    end
  end


-- Set a key mapping to call the command
lvim.builtin.which_key.mappings["o"] = { toggle_transparency, "Toggle colorcolumn" }
