-- Statusline. airline reads its g: vars at load time, so they go in `init`
-- (which lazy runs during startup, before the plugin loads).
return {
  'vim-airline/vim-airline',
  dependencies = { 'vim-airline/vim-airline-themes' },
  lazy = false,
  init = function()
    vim.o.laststatus = 2
    vim.g.airline_powerline_fonts = 1
    vim.g.airline_theme = 'solarized'
    vim.g.airline_solarized_bg = 'dark'
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#branch#enabled'] = 1
		vim.g.airline_left_sep = ''
		vim.g.airline_left_alt_sep = ''
		vim.g.airline_right_sep = ''
		vim.g.airline_right_alt_sep = ''
		vim.g['airline_symbols.branch'] = ''
		vim.g['airline_symbols.colnr'] = ' ℅:'
		vim.g['airline_symbols.readonly'] = ''
		vim.g['airline_symbols.linenr'] = ' :'
		vim.g['airline_symbols.maxlinenr'] = '☰ '
    vim.g['airline_symbols.dirty'] = '⚡'
  end,
}
