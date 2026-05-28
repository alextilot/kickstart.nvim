-- Linting (see also Mason tools in lua/custom/lsp/mason_tools.lua)

vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'
lint.linters_by_ft = lint.linters_by_ft or {}
lint.linters_by_ft.markdown = { 'markdownlint' }
lint.linters_by_ft.json = { 'jsonlint' }
lint.linters_by_ft.python = { 'pylint' }
lint.linters.pylint.cmd = 'python'
lint.linters.pylint.args = { '-m', 'pylint', '-f', 'json' }

local function eslint_config_exists()
  local configs = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    'package.json',
  }

  for _, config in ipairs(configs) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. config) == 1 then
      if config == 'package.json' then
        local file = io.open('package.json', 'r')
        if file then
          local content = file:read '*a'
          file:close()
          if content:match '"eslintConfig"%s*:' then
            return true
          end
        end
      else
        return true
      end
    end
  end

  return false
end

if eslint_config_exists() then
  lint.linters_by_ft.javascript = { 'eslint_d' }
  lint.linters_by_ft.typescript = { 'eslint_d' }
  lint.linters_by_ft.javascriptreact = { 'eslint_d' }
  lint.linters_by_ft.typescriptreact = { 'eslint_d' }
end

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})

vim.keymap.set('n', '<leader>l', function()
  lint.try_lint()
end, { desc = '[L]int buffer' })
