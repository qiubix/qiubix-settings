" ===== basic settings =====
set nocompatible
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

" ===== Ex commands settings =====
set wildmenu        "zsh-like hints of commands
set wildmode=full
set history=1000     "history size of Ex commands

" ===== intend, tabs =====
set nowrap
set tabstop=2
set shiftwidth=2
set autoindent
set copyindent
set smarttab
set expandtab

" ===== searching =====
set incsearch
set ignorecase
set smartcase
set nohlsearch

" ===== moving =====
set scrolloff=10

" ===== mappings =====
set timeout timeoutlen=150
inoremap jk <Esc>
nnoremap <silent> <C-N> :se invhlsearch<CR>
nnoremap <Space> <PageDown>
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" ====== Tabs and splits =====
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set splitbelow
set splitright

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

"==== Swap v and CTRL-V ======
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

"======== Disable visualbell ========
set vb t_vb=
set novisualbell
