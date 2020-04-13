" Add to freshrc:
" fresh jasoncodes/ctrlp-modified.vim lib/branch.sh --bin
" fresh jasoncodes/ctrlp-modified.vim lib/branch_modified.sh --bin
" fresh jasoncodes/ctrlp-modified.vim lib/modified.sh --bin
"
" Examples:
" https://github.com/junegunn/fzf/wiki/Examples-(vim)

Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Hide statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = {
  \   'window': 'call FloatingFZF()',
  \ }

function! FloatingFZF()
  let width = float2nr(&columns * 0.8)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
        \ 'row': (&lines - height) / 2,
        \ 'col': (&columns - width) / 2,
        \ 'width': width,
        \ 'height': height }

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

command! -bang FzfModified
  \ call fzf#run(extend({
  \   'source': 'modified.sh',
  \   'sink': 'e',
  \   'options': '--prompt="Modified> "',
  \ }, g:fzf_layout))

command! -bang FzfBranchModified
  \ call fzf#run(extend({
  \   'source': 'branch_modified.sh',
  \   'sink': 'e',
  \   'options': '--prompt="BranchModified> "',
  \ }, g:fzf_layout))

command! -bang FzfTagJump
  \ call fzf#vim#tags(
  \   expand('<cword>') . '$',
  \   {'options': '--nth=1,2 --delimiter="\t" --select-1 --exit-0 +i'}
  \ )

map <silent> <leader>t :FzfFiles<CR>
map <silent> <leader>l :FzfBuffers<CR>
map <silent> <leader>m :FzfModified<CR>
map <silent> <leader>M :FzfBranchModified<CR>
map <silent> <leader>d :exe 'FzfFiles ' . expand('%:p:h', 1)<CR>
map <silent> <C-]> :FzfTagJump<CR>
