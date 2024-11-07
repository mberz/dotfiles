-- cSpell:ignore tpope shiftwidth noremap nmap vmap imap autocmd augroup folke whichkey onedarkpro onedark olimorris reineke lukas blankline keybinds cpea nvim one_monokai Neovim
return
{
  -- NOTE: First, some plugins that don't require any configuration


  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',


  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
	"<leader>?",
	function()
	  require("which-key").show({ global = false })
	end,
	desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { -- Theme inspired by Atom
    'cpea2506/one_monokai.nvim',
    priority = 1000,
    config = function()
      require('one_monokai').setup({
        transparent = false,
        vim.cmd("colorscheme one_monokai"),
        colors = {
          -- fg = "#ffffff",
          fg = "#f6f7f8",
          bg = "#282c34",
          light_gray = "#9ca3b2",
        },
        themes = function(colors)
          return {
            Normal = {
              fg = colors["fg"]:lighten(0.2),
              bg = colors["bg"],
            },
          }
        end
      })
      -- vim.builtin.lualine.options.theme = "onemonokai"
    end,
  },
  -- { -- Onenord
  --   'rmehri01/onenord.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('onenord').setup({
  --         transparent = false,
  --       })
  --   end,
  -- },
  -- {
  --   'rainglow/vim',
  --   config = function()
  --     vim.cmd("colorscheme absent-light")
  --   end,
  -- },
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   requires = {
  --     -- "rainglow/vim",
  --     'cpea2506/one_monokai.nvim',
  --     'rmehri01/onenord.nvim',
  --   },
  --   config = {
  --     update_interval = 1000,
  --     set_dark_mode = function()
  --       vim.api.nvim_set_option("background", "dark")
  --       vim.cmd("colorscheme one_monokai")
  --       vim.builtin.lualine.options.theme = "onemonokai"
  --     end,
  --     -- set_light_mode = function()
  --     --   vim.api.nvim_set_option("background", "light")
  --     --   vim.cmd('colorscheme onenord')
  --     --   vim.builtin.lualine.options.theme = "onenord"
  --     -- end,
  --     -- set_light_mode = function()
  --     --   vim.api.nvim_set_option("background", "dark")
  --     --   vim.cmd("colorscheme one_monokai")
  --     --   vim.builtin.lualine.options.theme = "onemonokai"
  --     -- end,
  --     set_light_mode = function()
  --       vim.api.nvim_set_option("background", "light")
  --       vim.cmd('colorscheme absent-light')
  --       vim.builtin.lualine.options.theme = "onemonokai"
  --     end,
  --   },
  -- },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      indent = {
        char = "▏",
        -- smart_indent_cap = true,
        -- highlight = "IndentBlanklineChar",
      },
      scope = {
        enabled = true,
        char = "▎",
        -- highlight = "IndentBlanklineScope",
        show_start = true,
        show_end = true,
      },
    },
    config = function(_, opts)
      require("ibl").setup(opts)
      -- vim.cmd.highlight('clear @ibl.scope.underline.1')
      -- vim.cmd.highlight('link @ibl.scope.underline.1 MyHighlightGroup')
    end,
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  -- { import = 'custom.plugins' },
}
