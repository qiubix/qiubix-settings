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
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
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

call vundle#end()
filetype plugin indent on
" Vundle setup end }}}

" ==========[ BASIC SETTINGS ]=========={{{
syntax on

" colorscheme configuration
set background=dark
colorscheme solarized
"colorscheme default

" Quickly edit/reload the vimrc file
" WARNING - ;/: remapping forces to use ; instead of :
nmap <silent> <leader>ev ;tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv ;so $MYVIMRC<CR>

" buffer and files
set hidden					"hides buffers instead of closing them
set noswapfile      "it's all under git anyway..
set nobackup

set lazyredraw      "don't redraw when executing macros
set magic           "for regular expressions

" Ex commands settings
set wildmenu        "zsh-like hints of commands
set wildmode=full
set history=1000     "history size of Ex commands

set number					"display line numbers
set showmatch				"show matching parenthesis
set showcmd         "display incomplete command
set mouse=a         "use mouse to split/tab switching

" wrapping and indentation
set nowrap					"disable wrapping lines
set tabstop=2				"tab size
set shiftwidth=2		"indent size
set autoindent			"automaticaly indent
set copyindent			"copy with existing indentation
set smarttab				"insert tabs on the start of the line according to shiftwidth
set expandtab       "tabs replaced with multiple spaces

" searching
set incsearch				" move cursor to next occurence while typing
set ignorecase			" ignore case while searching
set smartcase				" don't ignore case when seach uses capitals
set nohlsearch			" turn off highlight searches, but:
										" Turn hlsearch off/on with CTRL-N
nnoremap <silent> <C-N> :se invhlsearch<CR>

" highlight last inserted text
nnoremap <leader>v `[<C-V>`]

" sane search - center cursor line
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
vnoremap <silent> n nzz
vnoremap <silent> N Nzz
" end of vim settings }}}

" ==========[ KEY MAPPINGS ]=========={{{
" key mappings timeout
" set timeout timeoutlen=500
:autocmd InsertEnter * set timeoutlen=150
:autocmd InsertLeave * set timeoutlen=1000

" mapping ESC to more convinient location
inoremap jk 	<Esc>
inoremap jj		<Esc>A;<Esc>

"==== moving around the file ====
nnoremap <Space> <PageDown>
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
set scrolloff=10

" adding new line from normal mode
" nmap <S-Enter> O<Esc>j
" nmap <CR> o<Esc>

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

" end of mappings }}}

" ==========[ PLUGIN CONFIGURATION ]=========={{{

" activate matchit plugin
runtime macros/matchit.vim

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

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
      \ 'dir':  '\v[\/]\.(git|hg|svn)\build$',
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

" ==== C/C++ settings
autocmd FileType c,cpp autocmd BufWritePre <buffer> ;%s/\s\+$//e

" tags support
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" end of file specific settings }}}

" Disable visualbell
set visualbell t_vb=
