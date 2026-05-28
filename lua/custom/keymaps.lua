return {
  setup = function()
    vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
  end,
}
