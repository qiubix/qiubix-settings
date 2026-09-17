-- Bootstrap lazy.nvim (https://github.com/folke/lazy.nvim) and load plugin specs
-- from lua/qiubix/plugins/. Requires vim.g.mapleader to be set first (done in
-- qiubix.remap, required before this module).

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    return
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "qiubix.plugins" } },
  install = { colorscheme = { "solarized" } },
  change_detection = { notify = false },
  checker = { enabled = false },
})
