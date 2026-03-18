# MDX Support in LazyVim

LazyVim has no official MDX extra. This is a custom setup that provides filetype detection, syntax highlighting, outline, formatting, and LSP support for `.mdx` files.

## Problem

LazyVim's `lang.markdown` extra registers `.mdx` as filetype `markdown.mdx` on the `VeryLazy` event. This is too late — files opened from the command line (`nvim file.mdx`) already have their filetype set (to nothing) before `VeryLazy` fires. Additionally, outline.nvim's built-in markdown provider and symbol filter don't handle the `markdown.mdx` compound filetype.

## How it works

### Filetype detection (`config/options.lua`)

```lua
vim.filetype.add({ extension = { mdx = "markdown.mdx" } })
vim.treesitter.language.register("markdown", "markdown.mdx")
```

Registers the filetype in `options.lua` (runs before lazy.nvim startup) instead of relying on LazyVim's `VeryLazy` registration. The treesitter call ensures the markdown parser is used for syntax highlighting.

### Outline provider (`lua/outline/providers/mdx.lua`)

A custom outline.nvim provider that parses `#` headings from the buffer. It:

- Matches filetypes `mdx` and `markdown.mdx`
- Skips YAML frontmatter (`---` blocks at the top of the file)
- Skips headings inside fenced code blocks
- Supports setext-style headings (`===` / `---` underlines)
- Builds a nested symbol tree with correct line positions

This exists because:

1. outline.nvim's built-in `markdown` provider checks filetypes with exact string match — `markdown.mdx` doesn't match `markdown`.
2. The LSP provider (`lsp`) has higher default priority and would intercept the request, but attached LSPs (tailwindcss, marksman) return empty symbols for MDX files.
3. outline.nvim's symbol filter (`LazyVim.config.kind_filter`) excludes the `String` kind (used for headings) for all filetypes except `markdown` and `help`.

### Outline config (`plugins/editor.lua`)

```lua
{
  "hedyhli/outline.nvim",
  opts = {
    providers = {
      priority = { "mdx", "markdown", "lsp", "coc", "norg", "man" },
    },
    symbols = {
      filter = {
        ["markdown.mdx"] = false,
      },
    },
  },
}
```

- Puts the custom `mdx` provider first so it handles MDX before any LSP.
- Sets the symbol filter for `markdown.mdx` to `false` (show all kinds),
  matching the behavior of plain `markdown`.

### Soft wrap (`config/autocmds.lua`)

Adds `"markdown.mdx"` to the soft-wrap autocmd pattern alongside `"markdown"`.

### LSP (`plugins/lsp.lua`)

Configures `mdx_analyzer` (the official `@mdx-js/language-server`) for both `mdx` and `markdown.mdx` filetypes. Mason auto-installs it. Provides completions, hover, diagnostics, and document links.

### Syntax highlighting (`after/queries/markdown/injections.scm`)

Treesitter injection queries that highlight `import` and `export` statements in MDX files as TypeScript. These extend the markdown parser queries and only trigger on lines matching those patterns.

### Formatting

Handled by the `lang.markdown` extra which configures prettier for `markdown.mdx`. Prettier auto-detects the MDX parser from the file extension.

## Files

```
config/nvim/lua/config/options.lua          # filetype + treesitter registration
config/nvim/lua/config/autocmds.lua         # soft wrap for markdown.mdx
config/nvim/lua/outline/providers/mdx.lua   # custom outline heading parser
config/nvim/lua/plugins/editor.lua          # outline.nvim provider priority + filter
config/nvim/lua/plugins/lsp.lua             # mdx_analyzer LSP
config/nvim/after/queries/markdown/injections.scm  # TypeScript injection queries
```

## Dependencies

- LazyVim extras: `lang.markdown`, `editor.outline`, `formatting.prettier`
- npm: `@mdx-js/language-server` (installed by Mason as `mdx-analyzer`)
