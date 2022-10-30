local use = require('packer').use

use {
  'nvim-lualine/lualine.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require('lualine').setup({
      options = {
        theme = 'tokyonight'
      }
    })
  end
}
