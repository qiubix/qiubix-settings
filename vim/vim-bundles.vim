" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Environment {

set nocompatible        " Must be first line
"set background=dark     " Assume a dark background

  " Windows Compatible {
  silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
  endfunction

  " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
  " across (heterogeneous) systems easier.
  if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

    " Be nice and check for multi_byte even if the config requires
    " multi_byte support most of the time
    if has("multi_byte")
      " Windows cmd.exe still uses cp850. If Windows ever moved to
      " Powershell as the primary terminal, this would be utf-8
      set termencoding=cp850
      " Let Vim use utf-8 internally, because many scripts require this
      set encoding=utf-8
      setglobal fileencoding=utf-8
      " Windows has traditionally used cp1252, so it's probably wise to
      " fallback into cp1252 instead of eg. iso-8859-15.
      " Newer Windows files might contain utf-8 or utf-16 LE so we might
      " want to try them first.
      set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
      set guifont=Sauce_Code_Powerline:h10:cEASTEUROPE
    endif
  endif
  " }

  " Install Vundle if not present {
    let vundle_present=1
    let vundle_readme=expand('$HOME/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
      echo "Installing Vundle.."
      echo ""
      silent !mkdir -p $HOME/.vim/bundle
      silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
      let vundle_present=0
    endif
  " }

  " Setup Bundle Support {
  " The next lines ensure that the ~/.vim/bundle/ system works
    filetype off
    set rtp+=$HOME/.vim/bundle/Vundle.vim
  " }

" }

if WINDOWS()
  let path='$HOME/.vim/bundle'
  call vundle#begin(path)
else
  call vundle#begin()
endif

" Bundles {

" Plugin manager
Plugin 'gmarik/Vundle.vim'

" Dependencies {
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
" }

" User interface {
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-bufferline'
" }

" Git {

" Git runtime files
Plugin 'tpope/vim-git'

" Git wrapper - use git from inside of vim
" Plugin 'tpope/vim-fugitive'

" git diff in special column, different coloring for lines
Plugin 'airblade/vim-gitgutter'

" }

" Editor enhancement {

" Relative line numbering
" Plugin 'myusuf3/numbers.vim'

" Boost TAB functionality
" Plugin 'ervandew/supertab'

" Display tags in current file
" Plugin 'Tagbar'
Plugin 'hashivim/vim-terraform'

" parenthesis/brackets finishing
Plugin 'Raimondi/delimitMate'

" Automatically end expressions
Plugin 'tpope/vim-endwise'

" Automatically surround
Plugin 'tpope/vim-surround'

" cpp/hpp file switching
"Plugin 'derekwyatt/vim-fswitch'

" }

" Word completion {
" Plugin 'drmingdrmer/xptemplate'
" Plugin 'scrooloose/syntastic'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
" }

" Browsing {

" Fuzzy search git project or directory
Plugin 'kien/ctrlp.vim'

" Sidebar directory browser
Plugin 'scrooloose/nerdtree'

" crazy project drawer / directory browser
"Plugin 'tpope/vim-vinegar'

" }

" Compilation / deployment {
Plugin 'tpope/vim-dispatch'
" }

" Others {
Plugin 'uguu-org/vim-matrix-screensaver'
" Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'vim-latex/vim-latex'

" }

" }

call vundle#end()

" Automatically install bundles on first startup {

if vundle_present == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

" }
