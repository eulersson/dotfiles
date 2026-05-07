return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Coverage", "CoverageLoad", "CoverageToggle", "CoverageSummary", "CoverageClear" },
    opts = function()
      -- Locate a python `.coverage` data file at or one level below cwd.
      -- Requires `pyproject.toml` in the same directory: filters out stray
      -- coverage files left from runs in the wrong cwd, and matches what
      -- `uv run` needs to resolve a project. Fallback `".coverage"` keeps
      -- old behavior when nothing usable is found.
      local function find_coverage_file()
        local skip = { ["node_modules"] = true, [".venv"] = true, venv = true, [".git"] = true }
        local cwd = vim.uv.cwd()
        local function has_pair(dir)
          return vim.uv.fs_stat(dir .. "/.coverage") and vim.uv.fs_stat(dir .. "/pyproject.toml")
        end
        if has_pair(cwd) then
          return cwd .. "/.coverage"
        end
        local handle = vim.uv.fs_scandir(cwd)
        if handle then
          while true do
            local name, type = vim.uv.fs_scandir_next(handle)
            if not name then
              break
            end
            if type == "directory" and not skip[name] and has_pair(cwd .. "/" .. name) then
              return cwd .. "/" .. name .. "/.coverage"
            end
          end
        end
        return ".coverage"
      end

      -- Pin the coverage command to the dir holding `.coverage` /
      -- `pyproject.toml` via `uv run --directory`, so it works whether
      -- nvim was opened at the project root or inside a subproject like
      -- `backend/`. `vim.fn.jobstart` splits the command string on spaces
      -- without invoking a shell, so don't use `shellescape` here, the
      -- literal quotes would survive into the args.
      local cov_file = find_coverage_file()
      local cov_dir = vim.fn.fnamemodify(cov_file, ":h")

      local base = {
        auto_reload = true,
        lang = {
          python = {
            coverage_command = "uv run --directory "
              .. cov_dir
              .. " coverage json --fail-under=0 -q -o -",
            coverage_file = cov_file,
          },
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
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tu", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
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
