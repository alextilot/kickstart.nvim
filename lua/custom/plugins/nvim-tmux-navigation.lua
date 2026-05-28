-- Tmux pane navigation (overrides CTRL+h/j/k/l from kickstart window splits)

vim.pack.add { 'https://github.com/alexghergh/nvim-tmux-navigation' }

require('nvim-tmux-navigation').setup {}

vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Move focus to the left tmux pane' })
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Move focus to the right tmux pane' })
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Move focus to the lower tmux pane' })
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Move focus to the upper tmux pane' })

  -- Configures neovim keymaps for tmux pane navigation.
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left tmux pane' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right tmux pane' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower tmux pane' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper tmux pane' })
