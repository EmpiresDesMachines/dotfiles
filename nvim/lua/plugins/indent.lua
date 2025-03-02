-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   main = "ibl",
--   opts = {
--     indent = {
--       char = "▏",
--       tab_char = "▏",
--       highlight = highlight,
--     },
--     scope = { enabled = false },
--   },
-- }

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local highlight = {
			"line",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "line", { fg = "#3b5364" })
		end)

		require("ibl").setup({
			scope = { enabled = false },
			-- indent = { char = "|" },
			indent = { char = "▏", tab_char = "▏", highlight = highlight },
		})
	end,
}
