return {
  'numToStr/Comment.nvim', opts = {
    toggler = {
      ---Line-comment toggle keymap
      line = 'mcc',
      ---Block-comment toggle keymap
      block = 'mbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'mc',
        ---Block-comment keymap
        block = 'mb',
    },
  },
}
