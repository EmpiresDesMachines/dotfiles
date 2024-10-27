return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			file_ignore_patterns = { "node%_modules/.*" },
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<S-k>"] = actions.move_selection_previous, -- move to prev result
						["<S-j>"] = actions.move_selection_next, -- move to next result
						["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		-- ripgrep is required for live_grep and grep_string and is the first priority for find_files.
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Lists previously open files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Lists open buffers in current neovim instance" })
		vim.keymap.set(
			"n",
			"<leader>fi",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Live fuzzy search inside of the currently open buffer" }
		)
		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })

		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		-- file browser
		vim.keymap.set("n", "<leader>ee", ":Telescope file_browser<CR>")
	end,
}
