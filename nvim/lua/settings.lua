local options = {
	cmdheight = 2, -- show incomplete commands
	conceallevel = 0, -- turn off conceal
	cursorline = true, -- display a line highlighting current cursor position
	listchars = "space:⋅,eol:↴", -- Change the invisible characters
	list = false, -- hide invisible characters by default
	incsearch = true, -- find next match as search query is entered
	ruler = true, -- show ruler
	number = true, -- show line numbers
	relativenumber = true, -- use relative line numbers
	linespace = 2, -- spacing between lines
	ignorecase = true, -- ignore case when searching
	signcolumn = "auto:4", -- allow up to 4 signs in sign column
	smartcase = true, -- switch to case sensitive if query contains uppercase characters
	termguicolors = true,
	mouse = "nv", -- enable mouse in normal and visual modes
	mousemoveevent = true,
	wrap = false,

	-- indentation
	autoindent = true, -- keep indent when creating a new line
	cindent = true, -- recomended setting for automatic c-style indentation
	expandtab = true, -- indent with spaces instead of tabs
	shiftwidth = 2, -- number of spaces to use in each indentation step
	smarttab = true, -- use with shiftwidth to insert or delete blanks
	softtabstop = 2, -- number of spaces to skip or insert when <BS>ing or <Tab>ing
	tabstop = 2, -- insert two spaces for a tab

	-- undo
	undofile = true,
	undolevels = 1000,
	undoreload = 10000,

	-- movement
	startofline = false, -- avoid moving cursor to start of line when jumping around
	scrolloff = 10, -- keep 10 context lines above and below cursor
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
