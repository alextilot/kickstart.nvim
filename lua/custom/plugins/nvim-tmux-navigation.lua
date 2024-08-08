-- Configure nvim & tmux pane navigation.
return {
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
  -- Configures neovim keymaps for tmux pane navigation.
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left tmux pane' }),
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right tmux pane' }),
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower tmux pane' }),
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper tmux pane' }),
}