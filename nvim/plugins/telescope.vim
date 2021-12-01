Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

nnoremap <Leader>t <cmd>Telescope find_files<cr>
nnoremap <Leader>ff <cmd>Telescope live_grep<cr>
nnoremap <Leader>l <cmd>Telescope buffers<cr>
nnoremap <Leader>m <cmd>Telescope git_status<cr>
nnoremap <Leader>cf <cmd>Telescope current_buffer_fuzzy_find<cr>
