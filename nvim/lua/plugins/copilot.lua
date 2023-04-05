return {
  "zbirenbaum/copilot-cmp",
  -- lazy = false,
  dependencies = "zbirenbaum/copilot.lua",
  opts = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = true },
    })
  end,
}
