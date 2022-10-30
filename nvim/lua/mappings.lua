vim.g.mapleader = ','

local map = vim.keymap.set

-- change to previous buffer
map("", "<Leader><Leader>", "<C-^>", {desc = 'Change to previous buffer'})

-- toggle wrap
map("n", "<Leader>w", ":set wrap!<CR>", {desc = 'Toggle wrap'})

-- move by visible line
map("n", "j", "v:count ? 'j' : 'gj'", {expr = true})
map("n", "k", "v:count ? 'k' : 'gk'", {expr = true})

-- window navigation
map("", "<C-h>", "<C-w>h", {desc = 'Move to left window'})
map("", "<C-j>", "<C-w>j", {desc = 'Move to down window'})
map("", "<C-k>", "<C-w>k", {desc = 'Move to up window'})
map("", "<C-l>", "<C-w>l", {desc = 'Move to right window'})

-- reselect visual block after indent or outdent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- indent current line
map("n", "=", "v=", {desc = 'Indent current line'})

-- jump to line start/end
map("", "H", "^", {desc = 'Jump to line start'})
map("", "L", "$", {desc = 'Jump to line end'})

-- select all
map("n", "<Leader>a", "ggVG", {desc = 'Select all'})

-- yank from cursor to line end
map("", "Y", "y$", {desc = 'Yank from cursor to line end'})

-- yank and put to/from system pasteboard
map("", "<Leader>y", '"*y', {desc = 'Yank to system pasteboard'})
map("n", "<Leader>yy", '"*yy', {desc = 'Yank to system pasteboard'})
map("", "<Leader>p", '"*p', {desc = 'Paste from system pasteboard'})
map("", "<Leader>P", '"*P', {desc = 'Paste from system pasteboard'})

-- clear search
map("", "<Leader>/", ":nohls<CR>", {silent = true, desc = 'Clear current search/highlight'})

-- higlight word/selection without changing position
map("n", "<Leader>h", ":let view=winsaveview()<CR>*:call winrestview(view)<CR>", {noremap = false, silent = true, desc = 'Highlight current word'})
map("v", "<Leader>h", ":<C-U>let view=winsaveview()<CR>gv*:<C-U>call winrestview(view)<CR>", {noremap = false, silent = true, desc = 'Highlight current word'})

-- toggle folds with space
map({"n", "v"}, "<Space>", "za", {desc = "Toggle fold"})
