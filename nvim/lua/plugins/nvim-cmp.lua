return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			config = function()
				local luasnip = require("luasnip")

				luasnip.filetype_extend("typescriptreact", { "html", "typescript" })
				luasnip.filetype_extend("javascriptreact", { "html", "javascript" })
				luasnip.filetype_extend("ruby", { "rails" })
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({ with_text = true }),
			},
		})
		cmp.setup.cmdline(":", {
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})
		cmp.setup.cmdline("/", {
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol" },
				{ name = "buffer" },
			}),
		})
	end,
}
