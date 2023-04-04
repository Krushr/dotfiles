return {
	"ntpeters/vim-better-whitespace",
	config = function()
		vim.g.better_whitespace_filetypes_blacklist = {
			"diff",
			"git",
			"gitcommit",
			"unite",
			"qf",
			"help",
			"markdown",
			"fugitive",
			"TelescopePrompt",
		}

		vim.g.better_whitespace_enabled = 1
		vim.keymap.set("n", "<Leader>sw", ":StripWhitespace<CR>:up<CR>", { desc = "Trim whitespace and save" })
	end,
}
