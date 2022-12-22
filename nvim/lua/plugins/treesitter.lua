return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'p00f/nvim-ts-rainbow',
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
  },
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
