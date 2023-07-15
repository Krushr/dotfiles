return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	config = function()
		local extension_path = vim.env.HOME .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb"
		local this_os = vim.loop.os_uname().sysname

		if this_os:find("Windows") then
			codelldb_path = extension_path .. "adapter\\codelldb.exe"
			liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
		else
			liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
		end
		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set(
						"n",
						"K",
						rt.hover_actions.hover_actions,
						{ desc = "Rust: Hover Actions", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"<Leader>ca",
						rt.code_action_group.code_action_group,
						{ desc = "Rust: Code Actions", buffer = bufnr }
					)
				end,
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		})
	end,
}
