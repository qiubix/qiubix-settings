vim.o.encoding = 'utf-8'
vim.o.ttyfast = true
vim.o.termguicolors = true

require("qiubix.remap")
require("qiubix.colors")

vim.wo.wrap = false
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- buffer and files
vim.o.hidden = true          -- hides buffers instead of closing them
vim.o.swapfile = false       -- it's all under git anyway...
vim.o.backup = false
vim.o.autoread = true        -- auto read file when it's changed from outside

vim.o.lazyredraw = true      -- don't redraw when executing macros
vim.o.magic = true           -- for regular expressions

-- Ex commands settings
vim.o.wildmenu = true        -- zsh-like hints of commands
vim.o.wildignorecase = true
vim.o.wildmode = "list:longest,full"
vim.o.history = 1000         -- history size of Ex commands
vim.o.undolevels = 1000

vim.o.number = true          -- display line numbers
vim.keymap.set('n', '<leader>l', ':set invrelativenumber<CR>', { noremap = true, silent = true })
vim.o.showmatch = true       -- show matching parenthesis
vim.o.showcmd = true         -- display incomplete command

-- Searching
vim.o.incsearch = true       -- move cursor to next occurrence while typing
vim.o.ignorecase = true      -- ignore case while searching
vim.o.smartcase = true       -- don't ignore case when search uses capitals
vim.o.hlsearch = false       -- turn off highlight searches, but:

-- toggle hlsearch with <leader>n
vim.keymap.set('n', '<leader>n', ':set invhlsearch<CR>', { noremap = true, silent = true })


-- Split behavior
vim.o.splitbelow = true
vim.o.splitright = true


