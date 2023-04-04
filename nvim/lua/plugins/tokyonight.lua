return {
	"folke/tokyonight.nvim",
	config = function()
		require("tokyonight").setup({
			style = "night",
		})
		vim.cmd("color tokyonight")
	end,
}
