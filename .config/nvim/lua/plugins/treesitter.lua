return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      modules = {},
      ignore_install = {},
      -- enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- https://github.com/windwp/nvim-ts-autotag/issues/192
      -- autotag = {
      --   enable = false,
      -- },
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      -- ensure these language parsers are installed
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "json",
        "regex",
        "xml",
        "dockerfile",
        "gitignore",
        "lua",
        "php",
        "twig",
        "bash",
        "c",
        "query",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "yaml",
        "toml",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
