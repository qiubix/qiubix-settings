" ==========[ TERMINAL SETTINGS ]=========={{{
" 256 colours
set t_Co=256

" UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" end of terminal settings }}}

"disable compatibility with previous versions
set nocompatible

" ==========[ SET UP PLUGINS WITH Vundle ]=========={{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'myusuf3/numbers.vim'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-dispatch'
Plugin 'drmingdrmer/xptemplate'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
" Vundle setup end }}}

" ==========[ BASIC SETTINGS ]=========={{{
syntax on

" colorscheme configuration
set background=dark
try
  colorscheme solarized
catch
endtry

" buffer and files
set hidden          "hides buffers instead of closing them
set noswapfile      "it's all under git anyway..
set nobackup

set lazyredraw      "don't redraw when executing macros
set magic           "for regular expressions

" Ex commands settings
set wildmenu        "zsh-like hints of commands
set wildignorecase
set wildmode=list:longest,full
set history=1000    "history size of Ex commands

set number          "display line numbers
set showmatch       "show matching parenthesis
set matchpairs+=<:>
set showcmd         "display incomplete command
set mouse=a         "use mouse to split/tab switching

" wrapping and indentation
set nowrap          "disable wrapping lines
set linebreak       "disable breaking words while wrapping lines
set tabstop=2       "tab size
set shiftwidth=2    "indent size
set autoindent      "automaticaly indent
set copyindent      "copy with existing indentation
set smarttab        "insert tabs on the start of the line according to shiftwidth
set expandtab       "tabs replaced with multiple spaces

" searching
set incsearch       " move cursor to next occurence while typing
set ignorecase      " ignore case while searching
set smartcase       " don't ignore case when seach uses capitals
set nohlsearch      " turn off highlight searches, but:
                    " Turn hlsearch off/on with CTRL-N
nnoremap <silent> <C-N> :se invhlsearch<CR>

" sane search - center cursor line
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
vnoremap <silent> n nzz
vnoremap <silent> N Nzz

" Setting cursorline while in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" folding
set foldenable      " Turn on folding
set foldmethod=syntax " Fold on the syntax
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

augroup vim_filetype
  au!
  au FileType vim setlocal foldmethod=marker
  au FileType vim setlocal foldlevel=0
augroup END
" set foldlevelstart=1
" let vimsyn_folding='af'

" Code folding options
" nmap <leader>f0 :set foldlevel=0<CR>
" nmap <leader>f1 :set foldlevel=1<CR>
" nmap <leader>f2 :set foldlevel=2<CR>
" nmap <leader>f3 :set foldlevel=3<CR>
" nmap <leader>f4 :set foldlevel=4<CR>
" nmap <leader>f5 :set foldlevel=5<CR>
" nmap <leader>f6 :set foldlevel=6<CR>
" nmap <leader>f7 :set foldlevel=7<CR>
" nmap <leader>f8 :set foldlevel=8<CR>
" nmap <leader>f9 :set foldlevel=9<CR>

" end of vim settings }}}

" ==========[ KEY MAPPINGS ]=========={{{
" key mappings timeout
" set timeout timeoutlen=500
:autocmd InsertEnter * set timeoutlen=150
:autocmd InsertLeave * set timeoutlen=1000

" mapping ESC to more convinient location
inoremap jk <Esc>
inoremap jj <Esc>A;<Esc>

"==== moving around the file ====
nnoremap <Space> <PageDown>
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap } }zz
nnoremap { {zz
set scrolloff=10

" disable useless Ex mode
nnoremap Q @@

" moving arount tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>

" moving around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" new split placing
set splitbelow
set splitright

"==== Swap v and CTRL-V ======
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" keep selection after intending
vnoremap < <gv
vnoremap > >gv

" other useful mappings
set pastetoggle=<F2>

" parenthesis and brackets tricks
inoremap ( (  )<ESC>hi
inoremap { {  }<ESC>hi
inoremap [ [  ]<ESC>hi

" end of mappings }}}

" ==========[ EXTRA SETTINGS and TRICKS ]=========={{{

" Quickly edit/reload the vimrc file
" WARNING - ;/: remapping forces to use ; instead of :
nmap <silent> <leader>ev ;tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv ;so $MYVIMRC<CR>

" highlight last inserted text
nnoremap <leader>v `[<C-V>`]

set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
"set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping
nnoremap <silent> <F12> :set invlist<CR>

" better yank to clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" make tilde an operator
set tildeop

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" }}} end of extra settings

" ==========[ PLUGIN CONFIGURATION ]=========={{{

" activate matchit plugin
runtime macros/matchit.vim

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:netrw_winsize = 20

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" NERDTree toggle mapping
" WARNING - ;/: remapping forces to use ; instead of :
map <silent> <C-E> ;NERDTreeToggle<CR>

" GitGutter config
highlight clear SignColumn
let g:gitgutter_highlight_lines = 0
nnoremap <F4> :GitGutterLineHighlightsToggle<CR>

"==== map switching between absolute and relative numbers =====
nnoremap <F3> :NumbersToggle<CR>

" ==== Hard-mode plugin ====
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" ==== CtrlP settings ====
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

" ==== Syntastic settings ====
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
      \ "mode": "passive" }

" ==== FSwitch settings ====
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
nmap <silent> <Leader>of ;FSHere<cr>

" end of plugin configuration }}}

" ==========[ forget about SHIFT entering COMMAND mode ]=========={{{
nnoremap ; :
nnoremap : ;

nnoremap q; q:
nnoremap q: q;

nnoremap @; @:
nnoremap @: @;

vnoremap ; :
vnoremap : ;
" end of :/; remapping }}}

" ==========[ FILE SPECIFIC SETTINGS ]=========={{{
" ==== latex settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
" Turn on spell checking for .tex files
au BufRead *.tex setlocal spell spelllang=pl,en,de

" ==== C/C++ settings
autocmd FileType c,cpp autocmd BufWritePre <buffer> ;%s/\s\+$//e

" tags support
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" end of file specific settings }}}

" Disable visualbell
set visualbell t_vb=
set novisualbell
