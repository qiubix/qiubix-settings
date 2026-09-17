-- nvim-treesitter, main branch. On `main`, highlighting is provided by Neovim core
-- (`vim.treesitter.start()`); the plugin only installs parsers + queries. The legacy
-- `require('nvim-treesitter.configs').setup{}` (master) API is incompatible with
-- Neovim 0.11+/0.12. Requires the `tree-sitter` CLI (Brewfile: tree-sitter-cli).
-- Unlike packer, lazy.nvim reliably tracks `branch = 'main'`.
--
-- NOTE: `vim.treesitter.start()` disables vim's regex syntax for the buffer, so we
-- only start it for languages whose parser is actually installed; everything else
-- falls back to built-in `:syntax` highlighting.

-- Parsers to keep installed.
local ensure = {
  'bash', 'lua', 'vim', 'vimdoc', 'query', 'diff',
  'java', 'python', 'go', 'rust',
  'javascript', 'typescript', 'tsx',
  'json', 'yaml', 'toml',
  'html', 'css', 'sql',
  'markdown', 'markdown_inline',
  'dockerfile', 'hcl', 'terraform',
  'gitcommit', 'gitignore',
}

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

    -- Install missing parsers (async; no-op for parsers already present).
    ts.install(ensure)

    -- Start treesitter highlighting for any filetype whose parser is available.
    -- If no parser, do nothing and let built-in `:syntax` handle it.
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.language.add, lang) then
          pcall(vim.treesitter.start, args.buf, lang)
        end
      end,
    })
  end,
}
