-- cSpell:words gitsigns nvim topdelete changedelete tpope Gwrite
return {
{
    'tpope/vim-fugitive',
    keys = {
      -- { "gsf", "<CMD>Gwrite<cr>",  desc = "Git stage file"},
      { "<leader>gc", "<CMD>Git commit<cr>",  desc = "Git commit"},
      { "<leader>gp", "<CMD>Git push<cr>",  desc = "Git push"},
      { "<leader>gP", "<CMD>Git pull<cr>",  desc = "Git pull"},
    }
  },
  'tpope/vim-rhubarb',

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      { "]g", "<CMD>Gitsigns next_hunk<cr>", "Next Hunk" },
      { "[g", "<CMD>Gitsigns prev_hunk<cr>", "Prev Hunk" },
      { "<leader>gs", "<CMD>Gitsigns stage_hunk<cr>",  desc = "Stage hunk"},
      { "<leader>gu", "<CMD>Gitsigns undo_stage_hunk<cr>",  desc = "Reset hunk"},
      { "<leader>gp", "<CMD>Gitsigns preview_hunk<cr>",  desc = "Preview hunk"},
      { "<leader>gr", "<CMD>Gitsigns reset_hunk<cr>",  desc = "Reset hunk"},
      { "<leader>ga", "<CMD>Gitsigns stage_buffer<cr>",  desc = "Stage buffer"},
    },
  },
}
