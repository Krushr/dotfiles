local fn = vim.fn

-- Install packer
local ensure_packer = function()
  local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_install_path})
    vim.cmd "packadd packer.nvim"
    return true
  else
    return false
  end
end

local packer_bootstrap = ensure_packer()

-- Install Plenary
local plenary_install_path = fn.stdpath("data") .. "/site/pack/packer/start/plenary.nvim"
if fn.empty(fn.glob(plenary_install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/nvim-lua/plenary.nvim", plenary_install_path})
    vim.cmd "packadd plenary.nvim"
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  local plugin_dir = fn.stdpath("config") .. "/lua/plugins"
  local plugin_files = require("plenary.scandir").scan_dir(plugin_dir, {depth = 1})

  for _, plugin_file in ipairs(plugin_files) do
    local plugin = string.match(plugin_file, plugin_dir .. "/([a-z-]+).lua")
    require("plugins." .. plugin)
  end

  use 'tpope/vim-fugitive'
  use 'tpope/vim-markdown'
  use 'tpope/vim-eunuch'
  use 'nvim-tree/nvim-web-devicons'
  use 'onsails/lspkind-nvim'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
