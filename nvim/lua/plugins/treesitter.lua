return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"HiPhish/nvim-ts-rainbow2",
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				query = {
					"rainbow-parens",
					html = "rainbow-tags",
				},
			},
			autotag = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
		})
	end,
}
