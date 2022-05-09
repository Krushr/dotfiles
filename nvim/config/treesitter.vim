lua <<EOF
  require'nvim-treesitter.configs'.setup {
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
    }
  }
EOF
