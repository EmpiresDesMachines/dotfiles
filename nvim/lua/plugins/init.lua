return {
	"nvim-lua/plenary.nvim",
	"tpope/vim-surround",
	"ap/vim-css-color",
	"romainl/vim-cool",
	"nvim-tree/nvim-web-devicons",
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- },
}
