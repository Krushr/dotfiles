local M = {
	"neovim/nvim-lspconfig",
	name = "lsp",
	event = "BufReadPre",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "folke/neodev.nvim" },
}

function M.config()
	require("mason")
	require("plugins.lsp.diagnostics").setup()
	require("neodev").setup()
	require("plugins.lsp.formatting").setup()

	local function on_attach(client, bufnr)
		require("plugins.lsp.mappings").setup(client, bufnr)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local servers = {
		solargraph = {
			diagnostics = true,
			useBundler = true,
		},
		lua_ls = {
			Lua = {
				telemetry = { enable = false },
				workspace = { checkThirdParty = false },
			},
		},
		pyright = {},
	}

	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
			})
		end,
	})
	require("plugins.null-ls").setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

return M
