return {
  {
    -- Let mini.diff stage lines from new/untracked files with `gh`.
    --
    -- mini.diff's git source diffs the buffer against git's index. When git has
    -- no index content for a file (untracked, intent-to-add, or empty), it
    -- unsets the reference text and `gh` errors with "Buffer has no reference
    -- text". This adds a custom source, tried before the git source, that
    -- claims exactly those files and gives them an empty reference (so every
    -- line shows as "added" and is stageable). Files that already have index
    -- content, ignored files and files inside `.git` fall through to the
    -- default git source, unchanged.
    "mini.diff",
    opts = function(_, opts)
      local MiniDiff = require("mini.diff")
      local git_source = MiniDiff.gen_source.git()

      -- Run git in `cwd`; return exit code and trimmed stdout.
      local function git(cwd, args)
        local out = vim.fn.system(vim.list_extend({ "git", "-C", cwd }, args))
        return vim.v.shell_error, vim.trim(out)
      end

      -- Resolve symlinks like mini.diff's git source does, so a symlinked file
      -- is looked up in the repo that actually holds it.
      local function buf_path(buf_id)
        return vim.loop.fs_realpath(vim.api.nvim_buf_get_name(buf_id)) or ""
      end

      -- Per-buffer index watchers so the gutter refreshes after staging.
      local watchers = {}
      local function stop_watch(buf_id)
        local w = watchers[buf_id]
        if not w then
          return
        end
        watchers[buf_id] = nil
        pcall(function()
          w.timer:stop()
          w.timer:close()
        end)
        pcall(function()
          w.fs_event:stop()
          w.fs_event:close()
        end)
      end

      -- Re-read the file's index blob and update the reference (main thread).
      local function refresh_ref(buf_id, dir, base)
        if not vim.api.nvim_buf_is_valid(buf_id) then
          return
        end
        local out = vim.fn.system({ "git", "-C", dir, "show", ":0:./" .. base })
        if vim.v.shell_error ~= 0 then
          out = "" -- untracked (e.g. unstaged back out): empty reference
        end
        pcall(MiniDiff.set_ref_text, buf_id, (out:gsub("\r\n", "\n")))
      end

      -- Watch `.git` for `index` changes, mirroring mini.diff's git source, so
      -- staging via `gh` (or externally) live-updates the reference and gutter.
      local function start_watch(buf_id, git_dir, dir, base)
        stop_watch(buf_id)
        local fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
        local on_index = vim.schedule_wrap(function()
          refresh_ref(buf_id, dir, base)
        end)
        fs_event:start(git_dir, { recursive = false }, function(_, filename)
          if filename ~= "index" then
            return
          end
          timer:stop() -- debounce during incremental staging
          timer:start(50, 0, on_index)
        end)
        watchers[buf_id] = { fs_event = fs_event, timer = timer }
      end

      local untracked_source = {
        name = "untracked",
        attach = function(buf_id)
          local path = buf_path(buf_id)
          if path == "" or vim.fn.filereadable(path) == 0 then
            return false
          end
          local dir = vim.fn.fnamemodify(path, ":h")
          local base = vim.fn.fnamemodify(path, ":t")
          local code, out = git(dir, { "rev-parse", "--path-format=absolute", "--git-dir", "--is-inside-work-tree" })
          if code ~= 0 then
            return false -- not a git repo
          end
          local git_dir, in_tree = unpack(vim.split(out, "\n"))
          if in_tree ~= "true" then
            return false -- inside `.git` (e.g. COMMIT_EDITMSG)
          end
          -- Size of the file's blob at index stage 0. Errors if not in the
          -- index (untracked); "0" if in the index but empty (intent-to-add).
          local scode, size = git(dir, { "cat-file", "-s", ":0:./" .. base })
          if scode == 0 and tonumber(size) and tonumber(size) > 0 then
            return false -- has index content: let the git source handle it
          end
          if git(dir, { "check-ignore", "-q", "--", base }) == 0 then
            return false -- ignored: `git add` would refuse to stage it
          end
          MiniDiff.set_ref_text(buf_id, "") -- no index content: empty reference
          start_watch(buf_id, git_dir, dir, base)
          return true
        end,
        detach = function(buf_id)
          stop_watch(buf_id)
        end,
        apply_hunks = function(buf_id, hunks)
          local path = buf_path(buf_id)
          local dir = vim.fn.fnamemodify(path, ":h")
          local base = vim.fn.fnamemodify(path, ":t")
          -- Give git an index entry so the patch can be applied to it, then
          -- reuse the git source's patch machinery to stage the hunks. The
          -- index watcher refreshes the reference once `git apply` finishes.
          git(dir, { "add", "--intent-to-add", "--", base })
          git_source.apply_hunks(buf_id, hunks)
        end,
      }

      opts.source = { untracked_source, git_source }
      return opts
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gi", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    },
  },
  {
    "juacker/git-link.nvim",
    opts = {
      -- Optional: Add custom URL rules for your Git hosting platform
      url_rules = {
        -- GitLab
        {
          pattern = "^git@([^:]+):(.+)%.git$",
          replace = "https://%1/%2",
          format_url = function(base_url, params)
            -- For single line
            if params.start_line == params.end_line then
              -- Generates GitLab URLs: https://host/project/-/blob/branch/path?ref_type=heads#L6
              return string.format(
                "%s/-/blob/%s/%s?ref_type=heads#L%d",
                base_url,
                params.branch,
                params.file_path,
                params.start_line
              )
            else
              -- For line ranges - GitLab uses dash to separate line ranges
              return string.format(
                "%s/-/blob/%s/%s?ref_type=heads#L%d-%d",
                base_url,
                params.branch,
                params.file_path,
                params.start_line,
                params.end_line
              )
            end
          end,
        },
      },
    },
    keys = {
      {
        "<leader>gu",
        function()
          require("git-link.main").copy_line_url()
        end,
        desc = "Copy code link to clipboard",
        mode = { "n", "x" },
      },
      {
        "<leader>gp",
        function()
          require("git-link.main").open_line_url()
        end,
        desc = "Open code link in browser",
        mode = { "n", "x" },
      },
    },
  },
}
