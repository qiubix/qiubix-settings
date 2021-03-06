" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
set nocompatible
" ===== terminal settings ====={
" 256 colours
set t_Co=256

" UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set title

" end of terminal settings }

" ===== plugin settings ====={

" identify system
silent function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
  return  (has('win16') || has('win32') || has('win64'))
endfunction

filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
if WINDOWS()
  let path='$HOME/.vim/bundle'
  call vundle#begin(path)
else
  call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'drmingdrmer/xptemplate'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()
"}

" ===== basic settings ====={
set hidden
set noswapfile
set nobackup
set lazyredraw      "don't redraw when executing macros
set magic           "for regular expressions
set number
set showmatch
set showcmd
set ruler
set backspace=indent,eol,start " make that backspace key work the way it should

syntax on " turn syntax highlighting on by default
filetype on " detect type of file
filetype indent on " load indent file for specific file type

" first, enable status line always
set laststatus=2
"}

" ===== Ex commands settings ====={
set wildmenu        "zsh-like hints of commands
set wildmode=full
set history=1000     "history size of Ex commands
"}

" ===== intend, tabs ====={
set nowrap
set tabstop=2
set shiftwidth=2
set autoindent
set copyindent
set smarttab
set expandtab
"}

" ===== searching ====={
set incsearch
set ignorecase
set smartcase
set nohlsearch
"}

" ===== moving ====={
set scrolloff=10
"}

" ===== mappings ====={
set timeout timeoutlen=150
inoremap jk <Esc>
nnoremap <silent> <leader>n :se invhlsearch<CR>
nnoremap <Space> <PageDown>
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
"}

" ====== Tabs and splits ====={
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
let g:BASH_Ctrl_j = 'off'
let g:C_Ctrl_j = 'off'
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set splitbelow
set splitright
"}

"==== Display help in new tab instead of split ===={
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
"}

"==== Swap v and CTRL-V ======{
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v
"}

"======== forget about SHIFT entering COMMAND mode ========{
nnoremap ; :
nnoremap : ;
nnoremap q; q:
nnoremap q: q;
nnoremap @; @:
nnoremap @: @;
vnoremap ; :
vnoremap : ;
"}

"======== Disable visualbell ========{
set vb t_vb=
set novisualbell
"}

" ===== plugin settings ====={
" activate matchit plugin
runtime macros/matchit.vim

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dark'

let g:netrw_winsize = 20

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" NERDTree toggle mapping
" WARNING - ;/: remapping forces to use ; instead of :
map <silent> <C-E> ;NERDTreeToggle<CR>

"}
