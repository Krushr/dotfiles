local use = require('packer').use

use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    local hop = require('hop')
    hop.setup()

    local map = vim.keymap.set
    local directions = require('hop.hint').HintDirection
    local positions = require('hop.hint').HintPosition
    map('', '<Leader>ef', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, {desc = 'Jump to character'})
    map('', '<Leader>eF', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {desc = 'Jump back to character'})
    map('', '<Leader>et', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, {desc = 'Jump before character'})
    map('', '<Leader>eT', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, {desc = 'Jump backward after character'})
    map('', '<Leader>ew', function()
      hop.hint_words({ direction = directions.AFTER_CURSOR })
    end, {desc = 'Jump to word'})
    map('', '<Leader>ee', function()
      hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
    end, {desc = 'Jump to word end'})
    map('', '<Leader>eb', function()
      hop.hint_words({ direction = directions.BEFORE_CURSOR })
    end, {desc = 'Jump backward to word'})
  end
}
