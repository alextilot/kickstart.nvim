-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Configure nvim & tmux pane navigation.
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {}
      vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', {})
      vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', {})
      vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', {})
      vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', {})
    end,
  },
}
