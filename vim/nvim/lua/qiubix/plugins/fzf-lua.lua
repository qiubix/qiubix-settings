-- Fuzzy finder (replaces ctrlp). Uses fzf + ripgrep (Brewfile).
--   <C-p>      -> fzf-lua picker menu (same as :FzfLua)
--   <leader>f -> find files
--   <leader>h -> toggle hidden files in the file picker
--   <leader>i -> toggle gitignored files in the file picker
--   <leader>s -> search file contents (live grep)
local timeoutlen

return {
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  keys = {
    { '<C-p>', function() require('fzf-lua').builtin() end, desc = 'FzfLua picker menu' },
    { '<leader>f', function() require('fzf-lua').files() end, desc = 'Find files' },
    { '<leader>s', function() require('fzf-lua').live_grep() end, desc = 'Search file contents (grep)' },
    { '<leader>b', function() require('fzf-lua').buffers() end, desc = 'Search open buffers' },
  },
  opts = {
    files = {
      hidden = false,
      winopts = {
        on_create = function(e)
          timeoutlen = vim.o.timeoutlen
          vim.o.timeoutlen = 250
          vim.keymap.set('t', '<leader>h', '<M-h>', { buffer = e.bufnr, silent = true })
          vim.keymap.set('t', '<leader>i', '<M-i>', { buffer = e.bufnr, silent = true })
        end,
        on_close = function()
          if timeoutlen then
            vim.o.timeoutlen = timeoutlen
            timeoutlen = nil
          end
        end,
      },
    },
  },
}
