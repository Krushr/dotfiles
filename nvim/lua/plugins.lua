return {
	"nvim-lua/plenary.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-markdown",
	"tpope/vim-eunuch",
	"nvim-tree/nvim-web-devicons",
	"onsails/lspkind-nvim",
	"tpope/vim-rake",
	"kchmck/vim-coffee-script",
	"nvim-lua/popup.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
