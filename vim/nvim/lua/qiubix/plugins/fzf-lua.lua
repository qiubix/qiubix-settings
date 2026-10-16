-- Fuzzy finder (replaces ctrlp). Uses fzf + ripgrep (Brewfile).
--   <C-p>      -> fzf-lua picker menu (same as :FzfLua)
--   <leader>f -> find files
--   <A-n>      -> toggle hidden files in the picker (Alt-h moves tmux panes)
--   <A-i>      -> toggle gitignored files in the picker
--   <leader>s -> search file contents (live grep)
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
      actions = {
        ['alt-h'] = false,
        ['alt-n'] = function(selected, opts)
          require('fzf-lua').actions.toggle_hidden(selected, opts)
        end,
      },
    },
  },
}
