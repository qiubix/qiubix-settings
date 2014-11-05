" 256 colours
set t_Co=256

" UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"disable compatibility with previous versions
set nocompatible

" Quickly edit/reload the vimrc file
" WARNING - ;/: remapping forces to use ; instead of :
nmap <silent> <leader>ev ;tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv ;so $MYVIMRC<CR>

" buffer and files
set hidden					"hides buffers instead of closing them
set noswapfile

" Ex commands settings
set wildmenu        "zsh-like hints of commands
set wildmode=full
set history=200     "history size of Ex commands

set number					"display line numbers
set showmatch				"show matching parenthesis

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

" sane search - center cursor line
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
vnoremap <silent> n nzz
vnoremap <silent> N Nzz

" key mappings timeout
set timeout timeoutlen=200

" mapping ESC to more convinient location
inoremap jk 	<Esc>
inoremap jj		<Esc>A;<Esc>

"==== moving around the file ====
nnoremap <Space> <PageDown>

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

vnoremap < <gv
vnoremap > >gv

"==== plugin configuration ====
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
syntax on


set background=dark
colorscheme solarized
"colorscheme default

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

map <silent> <C-E> ;NERDTreeToggle<CR>

" GitGutter config
highlight clear SignColumn
let g:gitgutter_highlight_lines = 0
nnoremap <F4> :GitGutterLineHighlightsToggle<CR>

"==== map switching between absolute and relative numbers =====
nnoremap <F3> :NumbersToggle<CR>

"======== forget about SHIFT entering COMMAND mode ========
nnoremap ; :
nnoremap : ;


let g:tex_flavor='latex'
autocmd FileType c,cpp autocmd BufWritePre <buffer> ;%s/\s\+$//e

" tags support
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
