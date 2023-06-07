return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				winblend = 20,
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")

		local map = function(key, func, desc)
			vim.keymap.set("n", key, func, { desc = desc })
		end
		local builtin = require("telescope.builtin")
		map("<Leader>t", builtin.find_files, "Find files (all)")
		map("<Leader>fg", builtin.git_files, "Find files (git)")
		map("<Leader>ff", require("telescope").extensions.live_grep_args.live_grep_args, "Live grep")
		map("<Leader>l", builtin.buffers, "List open buffers")
		map("<Leader>m", builtin.git_status, "List modified files")
		map("<Leader>cf", builtin.current_buffer_fuzzy_find, "Find in current file")
		map("<Leader>cd", builtin.diagnostics, "List LSP diagnostics")
	end,
}
