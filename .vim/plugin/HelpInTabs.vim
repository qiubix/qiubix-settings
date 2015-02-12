"==== Display help in new tab instead of split ====
augroup HelpInTabs
  autocmd!
  autocmd BufEnter *.txt call HelpInNewTab()
augroup END

"only apply to help files
function! HelpInNewTab()
  if &buftype == 'help'
    " convert the help window to a tab
    execute "normal \<C-W>T"
  endif
endfunction
