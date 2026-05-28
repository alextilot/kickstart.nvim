-- Python environment configuration for Neovim
-- This module handles Python host setup for Neovim's internal plugins
-- while allowing LSP servers to inherit the current project environment

local function find_neovim_python()
  local neovim_host = vim.fn.system('pyenv versions --bare 2>/dev/null | grep -q "^neovim-host$" && pyenv root 2>/dev/null')
  if vim.v.shell_error == 0 and neovim_host ~= '' then
    local neovim_host_python = vim.fn.trim(neovim_host) .. '/versions/neovim-host/bin/python3'
    if vim.fn.executable(neovim_host_python) == 1 then
      return neovim_host_python
    end
  end

  local pyenv_python = vim.fn.system('pyenv which python3 2>/dev/null')
  if vim.v.shell_error == 0 and pyenv_python ~= '' then
    return vim.fn.trim(pyenv_python)
  end

  local which_python = vim.fn.system('which python3 2>/dev/null')
  if vim.v.shell_error == 0 and which_python ~= '' then
    return vim.fn.trim(which_python)
  end

  return 'python3'
end

return {
  setup = function()
    vim.g.python3_host_prog = find_neovim_python()

    if vim.g.debug_python_env then
      print('Neovim Python host: ' .. vim.g.python3_host_prog)
    end
  end,

  info = function()
    local info = {
      host_prog = vim.g.python3_host_prog,
      current_python = vim.fn.trim(vim.fn.system('which python3 2>/dev/null')),
      pyenv_version = vim.fn.trim(vim.fn.system('pyenv version-name 2>/dev/null')),
    }

    print('Python Environment Info:')
    print('  Neovim host: ' .. (info.host_prog or 'not set'))
    print('  Current python3: ' .. (info.current_python or 'not found'))
    print('  Pyenv version: ' .. (info.pyenv_version or 'not available'))

    return info
  end,
}
