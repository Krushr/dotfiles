return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-t>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			direction = "float",
			float_opts = {
				border = "curved",
				width = 120,
				height = 40,
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
