set ideajoin        "utilize IntelliJ to do the smart line joining
set easymotion
set showcmd         "display part of the command
let mapleader = " " "remap <leader> to SPACE
nmap <bslash> <space>

" wrapping and indentation
set nowrap          "disable wrapping lines
set autoindent      "automaticaly indent
set copyindent      "copy with existing indentation

" line numbers
set number          "display line numbers
set relativenumber	"relative line numbers by default
nnoremap <silent> <leader>l :set invrelativenumber<CR>

" searching
set incsearch       " move cursor to next occurence while typing
set ignorecase      " ignore case while searching
set smartcase       " don't ignore case when seach uses capitals
nnoremap <silent> <leader>n :se invhlsearch<CR>

" sane search - center cursor line
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
vnoremap <silent> n nzz
vnoremap <silent> N Nzz

" key mappings
set timeout timeoutlen=200

" mapping ESC to more convinient location
inoremap jk   <Esc>
vnoremap jk   <Esc>
inoremap jj   <Esc>A;<Esc>

" moving around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" new split placing
set splitbelow
set splitright

nnoremap Y y$
nnoremap Q @@

"==== Swap v and CTRL-V ======
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

vnoremap < <gv
vnoremap > >gv

