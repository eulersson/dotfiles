return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()

    -- Set up dap-python with defaults
    require("dap-python").setup(debugpy_path .. "/venv/bin/python")

    -- Docker attach to already running server
    table.insert(dap.configurations.python, {
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
  end,
}
