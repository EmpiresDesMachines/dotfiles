local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Linebreaks for *.md,*.txt
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.md", "*.txt" }, command = "setlocal wrap linebreak" })

-- Remove insert mode commands delay
autocmd("InsertEnter", { pattern = "*", command = "set timeoutlen=250" })
autocmd("InsertLeave", { pattern = "*", command = "set timeoutlen=1000" })

-- Don't auto commenting new lines
autocmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" })

-- Restore the last cursor position
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
  group = "RestoreCursor",
  pattern = "*",
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
    local not_commit = vim.b[args.buf].filetype ~= "commit"

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Automatically delete all trailing whitespace on save
autocmd("BufWritePre", { pattern = "*", command = ":%s/\\s\\+$//e" })

-- Highlight yanked
augroup("YankHighlight", { clear = true })
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#ffcc00", fg = "#000000" })
autocmd("TextYankPost", {
  pattern = "*",
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})
