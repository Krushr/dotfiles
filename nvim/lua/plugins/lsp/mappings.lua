local M = {}

function M.setup(_, buffer)
	local map = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { desc = desc, buffer = buffer })
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map("<leader>rn", vim.lsp.buf.rename, "Rename")
	map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

	map("gd", vim.lsp.buf.definition, "Go to definition")
	map("gr", require("telescope.builtin").lsp_references, "Go to references")
	map("gI", vim.lsp.buf.implementation, "Go to implementation")
	map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

	map("K", vim.lsp.buf.hover, "Hover documentation")
	map("<C-k>", vim.lsp.buf.signature_help, "Signature documentation")

	map("gD", vim.lsp.buf.declaration, "Go to declaration")
	map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace: add folder")
	map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace: remove folder")
	map("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "Workspace: list folders")
end

return M
