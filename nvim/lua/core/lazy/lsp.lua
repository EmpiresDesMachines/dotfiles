return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"j-hui/fidget.nvim",
	},

	config = function()
		-- local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"html",
				"cssls",
				"cssmodules_ls",
				"emmet_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
		--
		-- cmp.setup({
		--     snippet = {
		--         expand = function(args)
		--            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		--         end,
		--     },
		--     mapping = cmp.mapping.preset.insert({
		--         ['<S-k>'] = cmp.mapping.select_prev_item(cmp_select),
		--         ['<S-j>'] = cmp.mapping.select_next_item(cmp_select),
		--         ['<S-y>'] = cmp.mapping.confirm({ select = true }),
		--         ["<S-Space>"] = cmp.mapping.complete(),
		--     }),
		--     sources = cmp.config.sources({
		--         { name = 'luasnip' }, -- For luasnip users.
		--         { name = 'nvim_lsp' },
		--         { name = 'path' },
		--     }, {
		--         { name = 'buffer' },
		--     })
		-- })

		vim.diagnostic.config({
			-- update_in_insert = true,
			virtual_text = false,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
