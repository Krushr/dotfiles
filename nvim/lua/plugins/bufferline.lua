return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'folke/tokyonight.nvim',
  },
  config = function()
    require('bufferline').setup({
      options = {
        diagnostics = "nvim_lsp",
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        separator_style = "slant",
      }
    })
  end
}
