Plug 'itchyny/lightline.vim'

let g:lightline = {}
let g:lightline.colorscheme = 'one'
let g:lightline.component = {'lineinfo': ' %3l:%-2v'}

let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'LightlineFugitive'
let g:lightline.component_function.readonly = 'LightlineReadonly'

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline.active =
  \ {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch' ],
  \     ['readonly', 'relativepath', 'modified' ]
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \   ]
  \ }

let g:lightline.inactive =
  \ {
  \   'left': [
  \     [ 'relativepath' ]
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ]
  \   ]
  \ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
