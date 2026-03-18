-- Custom outline.nvim provider for MDX files.
-- Parses markdown headings (# Title, ## Subtitle, etc.) into a symbol tree.

local M = {
  name = 'mdx',
}

function M.supports_buffer(bufnr)
  if bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local ft = vim.bo[bufnr].filetype
  return ft == 'mdx' or ft == 'markdown.mdx'
end

local function parse_headings(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local root = { children = {} }
  local level_symbols = { root }
  local max_level = 1
  local in_code_block = false
  local in_frontmatter = false

  -- Detect YAML frontmatter at the start of the file
  if lines[1] and lines[1]:match('^%-%-%-$') then
    in_frontmatter = true
  end

  for lnum, line in ipairs(lines) do
    -- Skip YAML frontmatter block
    if in_frontmatter then
      if lnum > 1 and line:match('^%-%-%-$') then
        in_frontmatter = false
      end
      goto continue
    end

    if line:find('^```') then
      in_code_block = not in_code_block
    end
    if in_code_block then
      goto continue
    end

    local hashes, title = line:match('^(#+)%s+(.+)$')

    -- Also support setext-style headings (underline with = or -)
    if not hashes and lines[lnum + 1] and #line:gsub('^%s*(.-)%s*$', '%1') > 0 then
      local next_line = lines[lnum + 1]
      if next_line:match('^=+%s*$') then
        hashes, title = '#', line
      elseif next_line:match('^-+%s*$') then
        hashes, title = '##', line
      end
    end

    if not hashes or not title then
      goto continue
    end

    local depth = #hashes + 1

    -- Find parent: walk up from depth-1 to find the nearest ancestor
    local parent
    for i = depth - 1, 1, -1 do
      if level_symbols[i] then
        parent = level_symbols[i].children
        break
      end
    end

    -- Close all deeper sections
    for i = depth, max_level do
      if level_symbols[i] then
        level_symbols[i].selectionRange['end'].line = lnum - 2
        level_symbols[i].range['end'].line = lnum - 2
        level_symbols[i] = nil
      end
    end
    max_level = depth

    local entry = {
      kind = 15, -- String (used by outline.nvim for headings)
      name = title,
      selectionRange = {
        start = { character = 0, line = lnum - 1 },
        ['end'] = { character = 0, line = lnum - 1 },
      },
      range = {
        start = { character = 0, line = lnum - 1 },
        ['end'] = { character = 0, line = lnum - 1 },
      },
      children = {},
    }

    parent[#parent + 1] = entry
    level_symbols[depth] = entry
    ::continue::
  end

  -- Close remaining open sections
  for i = 2, max_level do
    if level_symbols[i] then
      level_symbols[i].selectionRange['end'].line = #lines
      level_symbols[i].range['end'].line = #lines
    end
  end

  return root.children
end

function M.request_symbols(on_symbols, opts)
  local buf = vim.api.nvim_get_current_buf()
  on_symbols(parse_headings(buf), opts)
end

return M
