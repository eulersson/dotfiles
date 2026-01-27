return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
      },
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
      local debugpy_python = require("lazyvim.util").get_pkg_path("debugpy", "/venv/bin/python")

      require("dap-python").setup(debugpy_python)

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
