-- Claude Code runs in a single Snacks terminal managed by claudecode.nvim. It
-- opens as a side split (<leader>ac), or in a tab of its own (<leader>as).

local split_side = "right"
local claude ---@type snacks.win? the Snacks terminal running Claude

-- Snacks enters terminal mode whenever the Claude buffer is entered, which moves
-- the cursor to the bottom. Cancel that when Claude was left in normal mode, so
-- the cursor position survives switching tabs or windows.
local function on_claude_buf(win)
  claude = win
  if vim.b[win.buf].claude_keep_mode then
    return -- on_buf runs on every show
  end
  vim.b[win.buf].claude_keep_mode = true
  win:on("BufLeave", function()
    vim.b[win.buf].claude_left_normal = vim.fn.mode() ~= "t"
  end, { buf = true })
  -- added after Snacks' own BufEnter handler, so this runs after its startinsert
  win:on("BufEnter", function()
    if vim.b[win.buf].claude_left_normal then
      vim.cmd.stopinsert()
    end
  end, { buf = true })
end

local snacks_win_opts = { on_buf = on_claude_buf }

-- Show Claude in a first tab, filling it from the start so its output wraps at
-- full width. From the Claude tab, jump back to the previous one.
local function claude_tab()
  local term = require("claudecode.terminal")
  local bufnr = term.get_active_terminal_bufnr()

  for _, win in ipairs(bufnr and vim.fn.win_findbuf(bufnr) or {}) do
    local tab = vim.api.nvim_win_get_tabpage(win)
    if vim.t[tab].claude_tab then
      if tab == vim.api.nvim_get_current_tabpage() then
        pcall(vim.cmd.tabnext, "#")
      else
        vim.api.nvim_set_current_tabpage(tab)
      end
      return
    end
  end

  -- hide the side split if Claude is showing there
  if bufnr and #vim.fn.win_findbuf(bufnr) > 0 then
    term.simple_toggle()
  end

  vim.cmd("0tabnew")
  vim.t.claude_tab = true
  vim.bo.bufhidden = "wipe"

  -- Open in the tab's only window instead of a split. The override only applies
  -- to a new terminal; an existing one keeps the position it was created with,
  -- so set it for this show and put the split side back for <leader>ac.
  if bufnr and claude then
    claude.opts.position = "current"
  end
  term.open({ snacks_win_opts = vim.tbl_extend("force", snacks_win_opts, { position = "current" }) })
  if claude then
    claude.opts.position = split_side
  end
end

return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal_cmd = "claude --chrome",
      -- no background agents: /resume would attach them in fullscreen mode,
      -- which leaves nothing in the terminal buffer's scrollback
      env = { CLAUDE_CODE_DISABLE_AGENT_VIEW = "1" },
      terminal = {
        split_side = split_side,
        snacks_win_opts = snacks_win_opts,
      },
    },
    keys = {
      { "<leader>as", claude_tab, desc = "Claude (tab)" },
    },
  },
}
