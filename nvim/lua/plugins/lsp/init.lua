local M = {
	"neovim/nvim-lspconfig",
	name = "lsp",
	event = "BufReadPre",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
	require("mason")
	require("plugins.lsp.diagnostics").setup()

	local function on_attach(client, bufnr)
		require("plugins.lsp.formatting").setup(client, bufnr)
		require("plugins.lsp.mappings").setup(client, bufnr)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	local options = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(options)
		end,
		["solargraph"] = function()
			require("lspconfig").solargraph.setup({
				options,
				settings = {
					solargraph = {
						diagnostics = true,
						useBundler = true,
					},
				},
			})
		end,
	})
	require("plugins.null-ls").setup(options)
end

return M
