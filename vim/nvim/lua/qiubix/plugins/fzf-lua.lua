-- Fuzzy finder (replaces ctrlp). Uses fzf + ripgrep (Brewfile).
--   <leader>f -> find files
--   <leader>s -> search file contents (live grep)
return {
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  keys = {
    { '<leader>f', function() require('fzf-lua').files() end, desc = 'Find files' },
    { '<leader>s', function() require('fzf-lua').live_grep() end, desc = 'Search file contents (grep)' },
    { '<leader>b', function() require('fzf-lua').buffers() end, desc = 'Search open buffers' },
  },
  opts = {},
}
