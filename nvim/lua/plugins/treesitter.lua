return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"HiPhish/nvim-ts-rainbow2",
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
	},
	config = function()
		local rainbow = require("ts-rainbow")
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				strategy = {
					rainbow.strategy["global"],
					html = rainbow.strategy["local"],
					javascript = rainbow.strategy["local"],
				},
				query = {
					"rainbow-parens",
					html = "rainbow-tags",
					javascript = "rainbow-tags-react",
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
