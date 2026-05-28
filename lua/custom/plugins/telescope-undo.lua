-- Undo history picker (telescope.nvim is installed in init.lua section 4)

vim.pack.add { 'https://github.com/debugloop/telescope-undo.nvim' }

require('telescope').load_extension 'undo'

vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { desc = '[U]ndo history' })
