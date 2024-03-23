return {
	-- cond = false,
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"lua",
				"vim",
				"c",
				"javascript",
				"typescript",
				"tsx",
				"php",
				"html",
				"css",
				"scss",
				"json",
				"bash",
				"markdown",
				"markdown_inline",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				-- false will disable the whole extension
				enable = true,
			},

			indent = {
				enable = true,
			},
		})
	end,
	-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
	require("ts_context_commentstring").setup({}),
}
