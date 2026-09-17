-- Colorscheme. Loaded eagerly with high priority so colors apply before UI draws.
return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.o.background = 'dark'
    require('solarized').setup({})
    vim.cmd.colorscheme('solarized')
  end,
}
