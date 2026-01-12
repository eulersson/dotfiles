return {
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
        "<leader>go",
        function()
          require("git-link.main").open_line_url()
        end,
        desc = "Open code link in browser",
        mode = { "n", "x" },
      },
    },
  },
}
