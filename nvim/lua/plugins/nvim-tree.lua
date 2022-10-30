local use = require('packer').use

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('nvim-tree').setup()
    vim.keymap.set("n", "<Leader>n", ":NvimTreeToggle<CR>")
  end
}
