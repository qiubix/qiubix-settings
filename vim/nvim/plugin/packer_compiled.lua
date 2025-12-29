-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/karkat/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?.lua;/Users/karkat/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?/init.lua;/Users/karkat/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?.lua;/Users/karkat/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/karkat/.cache/nvim/packer_hererocks/2.1.1748459687/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ctrlp.vim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\17\1\0286\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0B\0\2\2\t\0\0\0X\0\4�6\0\0\0009\0\1\0'\1\16\0=\1\15\0K\0\1\0$ag --nogroup --nocolor --column\vackprg\aag\15executable\afn\1\0\2\vsilent\2\fnoremap\2\21:CtrlPBuffer<CR>\14<leader>b\6n\bset\vkeymap\1\0\2\tfile\22\\v\\.(exe|so|dll)$\bdir0\\v[\\/](\\.git|\\.hg|\\.svn|build|dist|target)$\24ctrlp_custom_ignore\1\3\0\0\t.git1cd %s && git ls-files -co --exclude-standard\23ctrlp_user_command\6g\bvim\2\0" },
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://github.com/ctrlpvim/ctrlp.vim"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["solarized.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\0246\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\1+\2\2\0=\2\6\0016\1\0\0009\1\1\1'\2\3\0=\2\2\0019\1\a\0004\3\0\0B\1\2\0016\1\0\0009\1\b\0019\1\t\1'\3\5\0B\1\2\1K\0\1\0\16colorscheme\bcmd\nsetup\18termguicolors\14solarized\frequire\tdark\15background\6o\bvim\0" },
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/maxmx03/solarized.nvim"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n�\5\0\0\2\0\29\0=6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0'\1\18\0=\1\17\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0'\1\24\0=\1\23\0006\0\0\0009\0\1\0'\1\26\0=\1\25\0006\0\0\0009\0\1\0'\1\28\0=\1\27\0K\0\1\0\b⚡\26airline_symbols.dirty\t☰ \30airline_symbols.maxlinenr\n :\27airline_symbols.linenr\b\29airline_symbols.readonly\n ℅:\26airline_symbols.colnr\b\27airline_symbols.branch\b\26airline_right_alt_sep\b\22airline_right_sep\b\25airline_left_alt_sep\b\21airline_left_sep&airline#extensions#branch#enabled'airline#extensions#tabline#enabled\tdark\25airline_solarized_bg\14solarized\18airline_theme\28airline_powerline_fonts\6g\bvim\0" },
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/karkat/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: solarized.nvim
time([[Config for solarized.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\0246\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\1\1+\2\2\0=\2\6\0016\1\0\0009\1\1\1'\2\3\0=\2\2\0019\1\a\0004\3\0\0B\1\2\0016\1\0\0009\1\b\0019\1\t\1'\3\5\0B\1\2\1K\0\1\0\16colorscheme\bcmd\nsetup\18termguicolors\14solarized\frequire\tdark\15background\6o\bvim\0", "config", "solarized.nvim")
time([[Config for solarized.nvim]], false)
-- Config for: ctrlp.vim
time([[Config for ctrlp.vim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\17\1\0286\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0B\0\2\2\t\0\0\0X\0\4�6\0\0\0009\0\1\0'\1\16\0=\1\15\0K\0\1\0$ag --nogroup --nocolor --column\vackprg\aag\15executable\afn\1\0\2\vsilent\2\fnoremap\2\21:CtrlPBuffer<CR>\14<leader>b\6n\bset\vkeymap\1\0\2\tfile\22\\v\\.(exe|so|dll)$\bdir0\\v[\\/](\\.git|\\.hg|\\.svn|build|dist|target)$\24ctrlp_custom_ignore\1\3\0\0\t.git1cd %s && git ls-files -co --exclude-standard\23ctrlp_user_command\6g\bvim\2\0", "config", "ctrlp.vim")
time([[Config for ctrlp.vim]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\n�\5\0\0\2\0\29\0=6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0'\1\18\0=\1\17\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0'\1\24\0=\1\23\0006\0\0\0009\0\1\0'\1\26\0=\1\25\0006\0\0\0009\0\1\0'\1\28\0=\1\27\0K\0\1\0\b⚡\26airline_symbols.dirty\t☰ \30airline_symbols.maxlinenr\n :\27airline_symbols.linenr\b\29airline_symbols.readonly\n ℅:\26airline_symbols.colnr\b\27airline_symbols.branch\b\26airline_right_alt_sep\b\22airline_right_sep\b\25airline_left_alt_sep\b\21airline_left_sep&airline#extensions#branch#enabled'airline#extensions#tabline#enabled\tdark\25airline_solarized_bg\14solarized\18airline_theme\28airline_powerline_fonts\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
