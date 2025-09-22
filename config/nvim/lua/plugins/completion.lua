return {
  "saghen/blink.cmp",

  opts = function(_, opts)
    local delay_ms = 1000
    -- disable auto_show
    opts.completion = opts.completion or {}
    opts.completion.menu = opts.completion.menu or {}
    opts.completion.menu.auto_show = false
    opts.completion.ghost_text = {
      enabled = true,
      -- Show the ghost text when an item has been selected
      show_with_selection = true,
      -- Show the ghost text when no item has been selected, defaulting to the first item
      show_without_selection = false,
      -- Show the ghost text when the menu is open
      show_with_menu = true,
      -- Show the ghost text when the menu is closed
      show_without_menu = false,
    }
    -- setup timer
    local timer = vim.uv.new_timer()
    vim.api.nvim_create_autocmd({ "CursorMovedI", "TextChangedI" }, {
      callback = function()
        timer:stop()
        timer:start(delay_ms or 1000, 0, function()
          timer:stop()
          vim.schedule(function()
            -- Only run in insert mode and not in DAP REPL
            if vim.api.nvim_get_mode()["mode"] == "i" then
              local buf_name = vim.api.nvim_buf_get_name(0)
              local filetype = vim.bo.filetype
              -- Skip for DAP REPL buffer (usually has 'dap-repl' filetype or '[dap-repl' in buffer name)
              if filetype ~= "dap-repl" and not buf_name:match("%[dap%-repl") then
                require("blink.cmp").show()
              end
            end
          end)
        end)
      end,
    })
  end,
}
