-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'vim-airline/vim-airline',
        requires = { 'vim-airline/vim-airline-themes' },
        config = function()
            vim.g.airline_powerline_fonts = 1
            vim.g.airline_theme = 'solarized'
            vim.g.airline_solarized_bg = 'dark'
            vim.g['airline#extensions#tabline#enabled'] = 1
            vim.g['airline#extensions#branch#enabled'] = 1
            vim.g.airline_left_sep = ''
            vim.g.airline_left_alt_sep = ''
            vim.g.airline_right_sep = ''
            vim.g.airline_right_alt_sep = ''
            vim.g['airline_symbols.branch'] = ''
            vim.g['airline_symbols.colnr'] = ' ℅:'
            vim.g['airline_symbols.readonly'] = ''
            vim.g['airline_symbols.linenr'] = ' :'
            vim.g['airline_symbols.maxlinenr'] = '☰ '
            vim.g['airline_symbols.dirty']='⚡'
        end
    }

    use {
        'maxmx03/solarized.nvim',
        config = function()
            vim.o.background = 'dark'
            ---@type solarized
            local solarized = require('solarized')
            vim.o.termguicolors = true
            vim.o.background = 'dark'
            solarized.setup({})
            vim.cmd.colorscheme 'solarized'
        end
    }

    use {
        'ctrlpvim/ctrlp.vim',
        config = function()
            vim.g.ctrlp_user_command = { '.git', 'cd %s && git ls-files -co --exclude-standard' }

            vim.g.ctrlp_custom_ignore = {
                dir = [[\v[\/](\.git|\.hg|\.svn|build|dist|target)$]],
                file = [[\v\.(exe|so|dll)$]],
            }

            -- Map <leader>b to :CtrlPBuffer
            vim.keymap.set('n', '<leader>b', ':CtrlPBuffer<CR>', { noremap = true, silent = true })

            -- Ack/Ag settings
            if vim.fn.executable('ag') == 1 then
                vim.g.ackprg = 'ag --nogroup --nocolor --column'
            end
        end
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

end)
