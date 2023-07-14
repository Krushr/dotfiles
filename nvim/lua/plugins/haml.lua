return {
	"tpope/vim-haml",
	ft = "haml",
	config = function()
		vim.cmd("autocmd BufRead,BufNewFile *.hamlc set ft=haml")
	end,
}
