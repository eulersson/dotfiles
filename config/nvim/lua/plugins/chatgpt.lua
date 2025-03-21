return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup()
  end,
  keys = {
    -- TODO: Would be nice to group them under "chatgpt", but folke doesn't seem to be willing to implement such feature:
    -- https://github.com/LazyVim/LazyVim/discussions/137
    { "<leader>pc", "<cmd>ChatGPT<CR>", "ChatGPT" },
    { "<leader>pe", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    { "<leader>pg", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    { "<leader>pt", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    { "<leader>pk", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    { "<leader>pd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    { "<leader>pa", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    { "<leader>po", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    { "<leader>ps", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    { "<leader>pf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    { "<leader>px", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    { "<leader>pr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    { "<leader>pl", "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim", -- optional
    "nvim-telescope/telescope.nvim",
  },
}
