return {
  setup = function()
    require('custom.env.python').setup()
    require('custom.options').setup()
    require('custom.keymaps').setup()
  end,
}
