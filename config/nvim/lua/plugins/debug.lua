return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Coverage", "CoverageLoad", "CoverageToggle", "CoverageSummary", "CoverageClear" },
    opts = function()
      local base = {
        auto_reload = true,
        lang = {
          python = { coverage_command = "uv run coverage json --fail-under=0 -q -o -" },
        },
      }
      local override = vim.g.coverage_override
      if override then
        base = vim.tbl_deep_extend("force", base, override)
      end
      return base
    end,
    keys = {
      { "<leader>uC", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage" },
      { "<leader>tC", "<cmd>CoverageLoad<cr>", desc = "Load Coverage" },
      { "<leader>ts", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      -- Remove auto-open/close listeners set by LazyVim or defaults
      dap.listeners.after.event_initialized["dapui_config"] = nil
      dap.listeners.before.attach.dapui_config = nil
      dap.listeners.before.launch.dapui_config = nil
      dap.listeners.before.event_terminated.dapui_config = nil
      dap.listeners.before.event_exited.dapui_config = nil
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_installation = false,
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
      "mason-org/mason.nvim",
    },
    config = function()
      local dap = require("dap")

      -- local debugpy_python = require("lazyvim.util").get_pkg_path("debugpy", "/venv/bin/python")
      -- require("dap-python").setup(debugpy_python)

      require("dap-python").setup("uv")

      local configs = dap.configurations.python or {}

      table.insert(configs, 1, {
        type = "python",
        request = "attach",

        name = "attach:remote:generic",
        connect = {
          host = "127.0.0.1",
          port = 5678,
        },
        mode = "remote",
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/app",
          },
        },
        justMyCode = false,
      })

      table.insert(configs, 1, {
        type = "python",
        request = "attach",
        name = "attach:local",
        connect = {
          host = "127.0.0.1",
          port = 5678,
        },
      })
    end,
  },
}
