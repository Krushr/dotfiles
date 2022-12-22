local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
	local nls = require("null-ls")
	nls.setup({
		sources = {
			nls.builtins.formatting.prettier,
			nls.builtins.formatting.rubocop,
			nls.builtins.formatting.stylua,
			nls.builtins.diagnostics.rubocop,
			nls.builtins.diagnostics.haml_lint,
			nls.builtins.diagnostics.eslint,
		},
		on_attach = options.on_attach,
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
