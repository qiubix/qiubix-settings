-- Fuzzy finder. Lazy-loaded on its commands / keymaps.
return {
  'ctrlpvim/ctrlp.vim',
  cmd = { 'CtrlP', 'CtrlPBuffer', 'CtrlPMRU' },
  keys = {
    { '<C-p>', '<cmd>CtrlP<cr>', desc = 'CtrlP find files' },
    { '<leader>b', '<cmd>CtrlPBuffer<cr>', desc = 'CtrlP buffers' },
  },
  init = function()
    vim.g.ctrlp_user_command = { '.git', 'cd %s && git ls-files -co --exclude-standard' }
    vim.g.ctrlp_custom_ignore = {
      dir = [[\v[\/](\.git|\.hg|\.svn|build|dist|target)$]],
      file = [[\v\.(exe|so|dll)$]],
    }
    -- Ack/Ag settings
    if vim.fn.executable('ag') == 1 then
      vim.g.ackprg = 'ag --nogroup --nocolor --column'
    end
  end,
}
