-- cSpell:words gitsigns nvim topdelete changedelete tpope Gwrite numhl linehl virt_text
return {
{
    'tpope/vim-fugitive',
    keys = {
      { "<leader>gc", "<CMD>Git commit<cr>",  desc = "Git commit"},
      { "<leader>gC", "<CMD>Git commit --amend<cr>",  desc = "Git commit amend"},
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
        -- nice looking left aligned pipe spanning the entire row
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      current_line_blame = true, -- show blame at the end of the line
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000, -- delay in ms
        ignore_whitespace = false, -- ignore trailing white spaces
      },
      sign_priority = 20, -- set higher sign priority to draw over other symbols in gutter
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
