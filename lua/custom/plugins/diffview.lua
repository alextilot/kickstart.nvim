vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

vim.keymap.set('n', '<leader><leader>v', function()
  if next(require('diffview.lib').views) == nil then
    vim.cmd 'DiffviewOpen'
  else
    vim.cmd 'DiffviewClose'
  end
end, { desc = 'Toggle [V]iew diff' })
