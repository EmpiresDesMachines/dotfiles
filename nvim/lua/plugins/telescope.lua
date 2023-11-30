return {
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')
    require('telescope').setup({
      file_ignore_patterns = { "node%_modules/.*" },
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<S-k>"] = actions.move_selection_previous, -- move to prev result
            ["<S-j>"] = actions.move_selection_next, -- move to next result
            -- ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
   })

    telescope.load_extension('fzf')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find string in cwd" })

    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Fuzzy find recent files" })
    vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
    -- vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Find string under cursor in cwd" })
  end
}

