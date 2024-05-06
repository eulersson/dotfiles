lvim.plugins = {
  "AckslD/swenv.nvim",
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },
  "christoomey/vim-tmux-navigator",
  {
    "cormacrelf/dark-notify",
    config = function()
      require('dark_notify').run()
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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        light_style = "storm",
        transparent = true,
      })
    end,
    init = function()
      lvim.colorscheme = "tokyonight"
    end
  },
  {
    "github/copilot.vim"
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
  {
    "MunifTanjim/exrc.nvim",
    config = function()
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
    end
  },
  "mg979/vim-visual-multi",
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
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio" },
  },
  {
    "nvim-neotest/neotest-python",
    dependencies = { "mfussenegger/nvim-dap-python" }
  },
  -- {
  --   "ray-x/go.nvim",
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", 'gomod' },
  --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  -- },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require("lsp_signature").setup()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  "stevearc/dressing.nvim",
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
}

-- Enable folding using Treesitter.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- If this option is true and fold method option is other than normal, every time a
-- document is opened everything will be folded.
vim.opt.foldenable = false

vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0, desc = "Goto type definition" })

-- Setup formatting.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" },
  { name = "shfmt" },
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
--
--   - https://github.com/LunarVim/LunarVim/issues/1857#issuecomment-1013641928
--   - https://www.reddit.com/r/lunarvim/comments/1334htt/comment/ji90g9v/?utm_source=share&utm_medium=web2x&context=3
--   - https://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
--   - https://unix.stackexchange.com/a/608179
--
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

-- By default the text width is 88. You can hard wrap a selection with `gw`.
vim.opt.textwidth = 88

-- TODO: When Neovim native exrc works with LunarVim, remove this 'MunifTanjim/exrc.nvim'
-- configuration-specific part. Keep an eye on https://github.com/LunarVim/LunarVim/issues/4242.

-- Toggle line diagnostics (the linting errors that show on the same line).
-- TODO: This does not work! How do I set the default! I asked on LunarVim: https://github.com/LunarVim/LunarVim/discussions/4549
vim.diagnostic.config({ virtual_text = true })
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

-- ChatGPT.nvim
lvim.builtin.which_key.mappings["z"] = {
  name = "+ChatGPT",
  mode = { "n", "v" },
  c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
  l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
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
