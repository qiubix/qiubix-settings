" 256 colours
set t_Co=256				

" UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"disable compatibility with previous versions
set nocompatible			

set hidden					"hides buffers instead of closing them

set number					"display line numbers
set showmatch				"show matching parenthesis

" wrapping and indentation
set nowrap					"disable wrapping lines
set tabstop=2				"tab size
set shiftwidth=2		"indent size
set autoindent			"automaticaly indent
set copyindent			"copy with existing indentation
set smarttab				"insert tabs on the start of the line according to shiftwidth
set expandtab

" searching
set incsearch				" move cursor to next occurence while typing
set ignorecase			" ignore case while searching
set smartcase				" don't ignore case when seach uses capitals
set nohlsearch			" turn off highlight searches, but:
										" Turn hlsearch off/on with CTRL-N
nnoremap <silent> <C-N> :se invhlsearch<CR>


" key mappings 
set timeout timeoutlen=200

" mapping ESC to more convinient location
inoremap jk 	<Esc>
inoremap jj		<Esc>A;<Esc>

" moving around the file
nnoremap <Space> <PageDown>

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


" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction

" mapping Vexplore toggle with Ctrl-E. 
" IMPORTANT: semicolon is needed to call function because of colon-semicolon remapping
map <silent> <C-E> ;call ToggleVExplorer()<CR>

let g:netrw_winsize = 20

" Hit enter in the file browser to open the selected
" " file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" GitGutter config
highlight clear SignColumn
let g:gitgutter_highlight_lines = 1

" ====== Enable dragging whole selection through text ======
runtime plugin/dragvisuals.vim                             
                                                           
vmap  <expr>  <LEFT>   DVB_Drag('left')                    
vmap  <expr>  <RIGHT>  DVB_Drag('right')                   
vmap  <expr>  <DOWN>   DVB_Drag('down')                    
vmap  <expr>  <UP>     DVB_Drag('up')                      
vmap  <expr>  D        DVB_Duplicate()                     
                                                           
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1                                       



"======== forget about SHIFT entering COMMAND mode ======== 
nnoremap ; :
nnoremap : ;

