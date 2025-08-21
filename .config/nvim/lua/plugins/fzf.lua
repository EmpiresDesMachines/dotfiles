-- sudo pacman -S fzf fd ripgrep bat git-delta
return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local fd_opts = table.concat({
      "--color=never",
      "--type f",
      "--follow",
      "--hidden",
      "--no-ignore-vcs",
      "--exclude node_modules",
      "--exclude .pnpm-store",
      "--exclude .yarn",
      "--exclude .next",
      "--exclude .git",
      "--exclude dist",
      "--exclude build",
      "--exclude package-lock.json",
      "--exclude pnpm-lock.yaml",
      "--exclude yarn.lock",
    }, " ")
    local rg_opts = table.concat({
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--max-columns=4096",
      "--follow",
      "--hidden",
      "--no-ignore-vcs",
      "-g '!node_modules'",
      "-g '!.pnpm-store'",
      "-g '!.yarn'",
      "-g '!.next'",
      "-g '!.git'",
      "-g '!dist'",
      "-g '!build'",
      "-g '!package-lock.json'",
      "-g '!pnpm-lock.yaml'",
      "-g '!yarn.lock'",
    }, " ")
    require("fzf-lua").setup({
      fzf_colors = true,
      files = {
        fd_opts = fd_opts,
        git_icons = true,
      },
      grep = {
        rg_opts = rg_opts,
      },
    })

    vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
    vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
    vim.keymap.set("n", "<leader>fm", ":FzfLua marks<CR>")
    vim.keymap.set("n", "<leader>fg", ":FzfLua grep_project<CR>")
    vim.keymap.set("n", "<leader>fx", ":FzfLua diagnostics_workspace<CR>")
    vim.keymap.set("n", "<leader>fc", ":FzfLua git_bcommits<CR>")
    vim.keymap.set("n", "<leader>fl", ":FzfLua lsp_references<CR>")
  end,
}
