-- return {
--   "vim-test/vim-test",
--   keys = {
--     { "<leader>tc", "<cmd>TestClass<cr>", desc = "Class" },
--     { "<leader>tf", "<cmd>TestFile<cr>", desc = "File" },
--     { "<leader>tl", "<cmd>TestLast<cr>", desc = "Last" },
--     { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Nearest" },
--     { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Suite" },
--     { "<leader>tv", "<cmd>TestVisit<cr>", desc = "Visit" },
--   },
--   config = function()
--     vim.g["test#strategy"] = "neovim"
--     vim.g["test#neovim#term_position"] = "belowright"
--     vim.g["test#neovim#preserve_screen"] = 1
--     vim.g["test#python#runner"] = "pytest"
--   end,
-- }


return {
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tNF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Debug File" },
      { "<leader>tL", "<cmd>lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = "Debug Last" },
      { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
      { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Last" },
      { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
      { "<leader>tT", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
      { "<leader>tto", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
      { "<leader>tTs", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
      { "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output panel"},
      { "<leader>tv", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary overview"},
    },
    dependencies = {
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-plenary",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    -- Cnfigure neotest
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            python = "python",
          }),
          require("neotest-plenary"),
          require("neotest-vim-test")({
            ignore_file_types = { "vim", "lua" },
          }),
        },
      })
    end,
  },
}
