-- Fuzzy finder (replaces ctrlp). Uses fzf + ripgrep (Brewfile).
--   <C-p>      -> fzf-lua picker menu (same as :FzfLua)
--   <leader>f -> find files
--   <leader>h -> toggle hidden files in file and live-grep pickers
--   <leader>i -> toggle gitignored files in file and live-grep pickers
--   <leader>s -> search file contents (live grep)
local timeoutlen

local function map_picker_toggles(e)
  timeoutlen = vim.o.timeoutlen
  vim.o.timeoutlen = 250
  vim.keymap.set('t', '<leader>h', '<M-h>', { buffer = e.bufnr, silent = true })
  vim.keymap.set('t', '<leader>i', '<M-i>', { buffer = e.bufnr, silent = true })
end

local function restore_timeoutlen()
  if timeoutlen then
    vim.o.timeoutlen = timeoutlen
    timeoutlen = nil
  end
end

local picker_winopts = {
  on_create = map_picker_toggles,
  on_close = restore_timeoutlen,
}

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
      winopts = picker_winopts,
    },
    grep = {
      hidden = false,
      no_ignore = false,
      winopts = picker_winopts,
      actions = {
        ['alt-h'] = function(selected, opts)
          require('fzf-lua').actions.toggle_hidden(selected, opts)
        end,
        ['alt-i'] = function(selected, opts)
          require('fzf-lua').actions.toggle_ignore(selected, opts)
        end,
      },
    },
  },
}
