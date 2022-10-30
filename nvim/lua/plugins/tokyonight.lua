local use = require('packer').use

use {
  'folke/tokyonight.nvim',
  config = function()
    require("tokyonight").setup({
      style = "night"
    })
  end
}
