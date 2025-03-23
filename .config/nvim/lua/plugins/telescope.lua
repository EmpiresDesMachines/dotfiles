return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    require("telescope").setup({
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "yarn.lock",
      },
      defaults = {
        path_display = { "smart" }, -- "filename_first", "smart", "truncate"
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

    vim.keymap.set("n", "<leader>ff", builtin.find_files,   { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,      { desc = "Lists open buffers in current neovim instance" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits,  { desc = "Search Git Commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string,  { desc = "Find Word under Cursor" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep,    { desc = "Find string in cwd" })

    vim.keymap.set("n", "<leader>fk", builtin.keymaps,      { desc = "Find Keymaps" })
    vim.keymap.set("n", "<leader>fc", builtin.colorscheme,  { desc = "Lists available colorschemes and applies them on <cr>" })

    vim.keymap.set("n", "<leader>fr", builtin.oldfiles,     { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,    { desc = "Find Help Tags" })
    vim.keymap.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find,
                                                            { desc = "Live fuzzy search inside of the currently open buffer" })
    --
    -- builtin.lsp_document_symbols	Lists LSP document symbols in the current buffer
    -- builtin.lsp_workspace_symbols	Lists LSP document symbols in the current workspace


  end
}
