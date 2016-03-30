Bundle 'Shougo/deoplete.nvim'

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
