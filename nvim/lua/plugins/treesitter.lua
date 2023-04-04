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
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_seleciton = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<c-backspace>",
				},
			},
		})
	end,
}
