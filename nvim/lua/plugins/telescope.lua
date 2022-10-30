local use = require('packer').use


use 'nvim-lua/popup.nvim'

use {
  'nvim-telescope/telescope.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        winblend = 20,
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')

    local map = vim.keymap.set
    local builtin = require('telescope.builtin')
    map('n', '<Leader>t', builtin.find_files, {desc = 'Find files'})
    map('n', '<Leader>ff', require('telescope').extensions.live_grep_args.live_grep_args, {desc = 'Live grep'})
    map('n', '<Leader>l', builtin.buffers, {desc = 'List open buffers'})
    map('n', '<Leader>m', builtin.git_status, {desc = 'List modified files'})
    map('n', '<Leader>cf', builtin.current_buffer_fuzzy_find, {desc = 'Find in current file'})
    map('n', '<Leader>cd', builtin.diagnostics, {desc = 'List LSP diagnostics'})
  end,
}

use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use 'nvim-telescope/telescope-live-grep-args.nvim'
