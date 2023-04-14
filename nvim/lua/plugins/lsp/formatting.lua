local M = {}

function M.format()
	if vim.lsp.buf.format then
		vim.lsp.buf.format()
	else
		vim.lsp.buf.formatting_sync()
	end
end

function M.setup()
	local format_on_save_enabled = true
	vim.api.nvim_create_user_command("LspFormatToggle", function()
		format_on_save_enabled = not format_on_save_enabled
		print("Setting autoformatting to: " .. tostring(format_on_save_enabled))
	end, {})

	vim.keymap.set("n", "<Leader>ft", ":LspFormatToggle<CR>", { desc = "LSP: Toggle format on save" })

	local _augroups = {}
	local get_augroup = function(client)
		if not _augroups[client.id] then
			local group_name = "lsp-format" .. client.name
			local id = vim.api.nvim_create_augroup(group_name, { clear = true })
			_augroups[client.id] = id
		end
		return _augroups[client.id]
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach-format", { clear = true }),
		callback = function(args)
			local client_id = args.data.client_id
			local client = vim.lsp.get_client_by_id(client_id)
			local buf = args.buf

			local ft = vim.api.nvim_buf_get_option(buf, "filetype")
			local nls = require("plugins.null-ls")

			local client_supports_formatting = false
			if nls.has_formatter(ft) then
				client_supports_formatting = client.name == "null-ls"
			else
				client_supports_formatting = not (client.name == "null-ls")
			end

			client.server_capabilities.documentFormattingProvider = client_supports_formatting

			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = get_augroup(client),
					buffer = buf,
					callback = function()
						if not format_on_save_enabled then
							return
						end

						M.format()
					end,
				})
			end
		end,
	})
end

return M
