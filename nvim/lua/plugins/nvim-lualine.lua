return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
	require("lualine").setup({
	  options = {
	    section_separators = { left = "", right = ""},
		theme = "auto",
	  },
	  sections = {
	    lualine_y = {},
		lualine_c = { "%F" },
		lualine_z = { "%aLN:%l/%L Col:%03c" },
	  },
	})
  end,
}