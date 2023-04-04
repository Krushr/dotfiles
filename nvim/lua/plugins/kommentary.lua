return {
	"b3nj5m1n/kommentary",
	config = function()
		vim.g.kommentary_create_default_mappings = false
		require("kommentary.config").configure_language("default", {
			prefer_single_line_comments = true,
		})
		local map = vim.keymap.set
		map("n", "<leader>cc", "<Plug>kommentary_line_default", { desc = "Toggle current line comment" })
		map("n", "<leader>c", "<Plug>kommentary_motion_default", { desc = "Toggle comment for motion" })
		map("x", "<leader>c", "<Plug>kommentary_visual_default", { desc = "Toggle comment for selection" })
	end,
}
