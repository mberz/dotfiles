-- cSpell:ignore lualine nvim statusline one_monokai fileformat
return { -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'one_monokai',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        {'branch', icon = ''},
        {'diff'},
        {
          'diagnostics',
          sources = {'nvim_diagnostic'},
          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },
          symbols = {error = 'E ', warn = 'W ', info = 'I ', hint = 'H '},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        }
      },
      lualine_c = {
        {
          'filename',
          modified_icon = '',
          file_status = true,
        }
      },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  },
}
