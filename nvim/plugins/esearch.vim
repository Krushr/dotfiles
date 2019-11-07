Plug 'eugen0329/vim-esearch'

let g:esearch = {
  \ 'adapter':          'rg',
  \ 'backend':          'nvim',
  \ 'out':              'qflist',
  \ 'batch_size':       1000,
  \ 'use':              [],
  \ 'default_mappings': 1,
  \}
