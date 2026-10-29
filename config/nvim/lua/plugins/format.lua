-- Prettier pads Markdown tables so the columns line up, and has no option to turn that off.
-- To keep tables as written, put a `prettier-ignore` comment before each table
-- before Prettier runs, and take those comments out again afterwards.

-- The extra spaces tell these comments apart from any already in the file.
local IGNORE_MARK = "<!--  prettier-ignore  -->"

-- Split off indentation and blockquote markers, so tables in lists and quotes work too.
local function split_prefix(line)
  local prefix = line:match("^[ \t>]*")
  return prefix, line:sub(#prefix + 1)
end

local function is_delimiter_row(line)
  local _, body = split_prefix(line)
  return body:find("|", 1, true) and body:find("-", 1, true) and body:match("^[|:%- \t]+$") ~= nil
end

local function is_ignore_comment(line)
  local _, body = split_prefix(line or "")
  return body:match("^<!%-%-%s*prettier%-ignore%s*%-%->%s*$") ~= nil
end

-- Prettier also formats Markdown inside code blocks, so tables there get marked too.
local MARKDOWN_LANGS = { md = true, markdown = true, mdx = true }

local function mark_tables(_, _, lines, callback)
  local out, in_table = {}, false
  local fence, fence_is_markdown = nil, false
  for i, line in ipairs(lines) do
    local prefix, body = split_prefix(line)
    local fence_marker = body:match("^```+") or body:match("^~~~+")
    local closes_fence = fence
      and fence_marker
      and body:match("^[`~]+%s*$")
      and fence_marker:sub(1, 1) == fence:sub(1, 1)
      and #fence_marker >= #fence
    if closes_fence then
      fence, in_table = nil, false
    elseif not fence and fence_marker then
      fence, in_table = fence_marker, false
      fence_is_markdown = MARKDOWN_LANGS[body:match("^[`~]+%s*(%w+)") or ""] or false
    elseif fence and not fence_is_markdown then
      -- Inside a code block in another language: leave it alone.
    elseif in_table then
      in_table = body:match("^%s*$") == nil
    elseif body:find("|", 1, true) and lines[i + 1] and is_delimiter_row(lines[i + 1]) then
      in_table = true
      -- Skip tables that start on a list item's first line, or that are already ignored.
      if not (body:match("^[-*+]%s") or body:match("^%d+[.)]%s") or is_ignore_comment(out[#out])) then
        table.insert(out, prefix .. IGNORE_MARK)
      end
    end
    table.insert(out, line)
  end
  callback(nil, out)
end

local function unmark_tables(_, _, lines, callback)
  callback(
    nil,
    vim.tbl_filter(function(line)
      local _, body = split_prefix(line)
      return vim.trim(body) ~= IGNORE_MARK
    end, lines)
  )
end

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.zsh = { "shfmt" }

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier_mark_tables = { format = mark_tables }
      opts.formatters.prettier_unmark_tables = { format = unmark_tables }

      for _, ft in ipairs({ "markdown", "markdown.mdx" }) do
        local names = opts.formatters_by_ft[ft] or {}
        for i, name in ipairs(names) do
          if name == "prettier" then
            table.insert(names, i + 1, "prettier_unmark_tables")
            table.insert(names, i, "prettier_mark_tables")
            break
          end
        end
      end
    end,
  },
}
