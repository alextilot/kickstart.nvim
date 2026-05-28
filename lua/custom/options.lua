return {
  setup = function()
    vim.g.have_nerd_font = true
    vim.o.termguicolors = true

    vim.opt.spelllang = 'en_us'
    vim.opt.spell = true
    vim.opt.swapfile = false
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.relativenumber = true
    vim.opt.hlsearch = true
  end,
}
