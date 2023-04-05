local M = {}

function M.setup(_, buffer)
	local map = function(mode, keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set(mode, keys, func, { desc = desc, buffer = buffer })
	end
	local nmap = function(keys, func, desc)
		map("n", keys, func, desc)
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
	nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("v", "<leader>ca", vim.lsp.buf.range_code_action, "Code Action")

	nmap("gd", vim.lsp.buf.definition, "Go to definition")
	nmap("gr", require("telescope.builtin").lsp_references, "Go to references")
	nmap("gI", vim.lsp.buf.implementation, "Go to implementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type definition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

	nmap("K", vim.lsp.buf.hover, "Hover documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature documentation")

	nmap("gD", vim.lsp.buf.declaration, "Go to declaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace: add folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace: remove folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "Workspace: list folders")
end

return M
