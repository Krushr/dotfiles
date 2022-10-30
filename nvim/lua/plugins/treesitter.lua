local use = require('packer').use

use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = "all",
      highlight = {
        enable = true
      },
      rainbow = {
        enable = true,
        extended_mode = true
      },
      autotag = {
        enable = true,
      },
      endwise = {
        enable = true,
      }
    }
  end
}
use {'nvim-treesitter/nvim-treesitter-context', requires = "nvim-treesitter/nvim-treesitter"}
use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter'}
use {'windwp/nvim-ts-autotag', requires = 'nvim-treesitter/nvim-treesitter'}
use {'RRethy/nvim-treesitter-endwise', requires = 'nvim-treesitter/nvim-treesitter'}
