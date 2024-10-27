return {
	"easymotion/vim-easymotion",
	config = function()
		-- vim.cmd("let g:EasyMotion_do_mapping = 0")
		vim.cmd("let g:EasyMotion_smartcase = 1")
		-- Move to char(s)
		vim.api.nvim_set_keymap("n", "<leader><leader>s", "<Plug>(easymotion-s)", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader><leader>m", "<Plug>(easymotion-s2)", { silent = true })
		-- Move to word
		vim.api.nvim_set_keymap("n", "<leader><leader>w", "<Plug>(easymotion-bd-w)", { silent = true })
		-- Move to line
		vim.api.nvim_set_keymap("n", "<leader><leader>j", "<Plug>(easymotion-j)", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader><leader>k", "<Plug>(easymotion-k)", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader><leader>l", "<Plug>(easymotion-bd-jk)", { silent = true })
	end,
}
