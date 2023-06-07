return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local actions = require("telescope.actions")

		local preview_as_image = function(filepath, bufnr, opts)
			local is_image = function(filepath)
				local supported_extensions = { "png", "jpg" }
				local split_path = vim.split(filepath:lower(), ".", { plain = true })
				local extension = split_path[#split_path]
				return vim.tbl_contains(supported_extensions, extension)
			end
			if is_image(filepath) then
				local term = vim.api.nvim_open_term(bufnr, {})
				local function send_output(_, data, _)
					for _, d in ipairs(data) do
						vim.api.nvim_chan_send(term, d .. "\r\n")
					end
				end
				vim.fn.jobstart({
					"catimg",
					filepath,
				}, { on_stdout = send_output, stdout_buffered = true, pty = true })
			else
				require("telescope.previewers.utils").set_preview_message(
					bufnr,
					opts.winid,
					"Binary cannot be previewed"
				)
			end
		end

		require("telescope").setup({
			defaults = {
				preview = {
					mime_hook = preview_as_image,
				},
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
