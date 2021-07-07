lua <<EOF
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
EOF
