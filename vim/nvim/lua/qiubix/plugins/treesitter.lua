-- nvim-treesitter, main branch. On `main`, highlighting is provided by Neovim core
-- (`vim.treesitter.start()`); the plugin only installs parsers + queries. The legacy
-- `require('nvim-treesitter.configs').setup{}` (master) API is incompatible with
-- Neovim 0.11+/0.12. Requires the `tree-sitter` CLI (Brewfile: tree-sitter-cli).
-- Unlike packer, lazy.nvim reliably tracks `branch = 'main'`.
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    local ok, ts = pcall(require, 'nvim-treesitter')
    if not ok or type(ts.install) ~= 'function' then
      vim.notify(
        'nvim-treesitter main-branch API not found — check branch=main / reinstall.',
        vim.log.levels.WARN
      )
      return
    end

    ts.setup({ install_dir = vim.fn.stdpath('data') .. '/site' })

    -- Parsers to keep installed (async; no-op if already present).
    ts.install({
      'lua', 'vim', 'vimdoc', 'query',
      'java', 'python',
      'markdown', 'markdown_inline',
    })

    -- Enable treesitter highlighting per filetype.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lua', 'vim', 'help', 'query', 'java', 'python', 'markdown' },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
