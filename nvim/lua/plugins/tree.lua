return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup()
  end,
}
