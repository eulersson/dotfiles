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
          'pyright', 'black', 'ruff', 'prettier', 'debugpy'
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
}

-- Set theme.
lvim.colorscheme = "catppuccin"

-- Automatically install python syntax highlighting.
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- Setup formatting.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    args = { "--print-width", "88", "--prose-wrap", "always" },
  },
}

-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py" }

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

-- Toggle line diagnostics (the linting errors that show on the same line).
-- TODO: Is this the correct way of keeping state?
local diagnostics_active = true;
lvim.builtin.which_key.mappings["lx"] = {
  function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.config({
        virtual_text = true,
      })
    else
      vim.diagnostic.config({
        virtual_text = false,
      })
    end
  end,
  "Toggle Inline Diagnostics"
}
