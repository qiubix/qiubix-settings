-- Remap leader to <SPACE>
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Reload NeoVim config
-- vim.keymap.set("n", "<leader>sv", 

-- Adjust timeoutlen when entering/leaving Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.o.timeoutlen = 200
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.o.timeoutlen = 1000
  end,
})

-- Insert mode: jk to escape
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- Moving around the file
vim.keymap.set('n', '<Space>', '<PageDown>', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'gk', 'k', { noremap = true })
vim.keymap.set('n', 'gj', 'j', { noremap = true })
vim.keymap.set('n', '}', '}zz', { noremap = true })
vim.keymap.set('n', '{', '{zz', { noremap = true })

-- Set scrolloff
vim.o.scrolloff = 10

-- Disable Ex mode
vim.keymap.set('n', 'Q', '@@', { noremap = true })

-- Center cursor line on search
vim.keymap.set('n', 'n', 'nzz', { silent = true, noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true, noremap = true })
vim.keymap.set('v', 'n', 'nzz', { silent = true, noremap = true })
vim.keymap.set('v', 'N', 'Nzz', { silent = true, noremap = true })

-- Tab navigation
vim.keymap.set('n', 'th', ':tabfirst<CR>', { noremap = true })
vim.keymap.set('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.keymap.set('n', 'tl', ':tablast<CR>', { noremap = true })
vim.keymap.set('n', 'tt', ':tabedit ', { noremap = true })  -- note: leaves cursor in command-line
vim.keymap.set('n', 'tn', ':tabnew<CR>', { noremap = true })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Swap v and <C-V> (visual and block modes)
vim.keymap.set('n', 'v', '<C-V>', { noremap = true })
vim.keymap.set('n', '<C-V>', 'v', { noremap = true })
vim.keymap.set('v', 'v', '<C-V>', { noremap = true })
vim.keymap.set('v', '<C-V>', 'v', { noremap = true })

-- Keep selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

