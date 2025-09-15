local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Linebreaks for *.md,*.txt
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.md", "*.txt" }, command = "setlocal wrap linebreak" })

-- Remove insert mode commands delay
autocmd("InsertEnter", { pattern = "*", command = "set timeoutlen=250" })
autocmd("InsertLeave", { pattern = "*", command = "set timeoutlen=1000" })

-- Don't auto commenting new lines
autocmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" })

-- Automatically delete all trailing whitespace on save
autocmd("BufWritePre", { pattern = "*", command = ":%s/\\s\\+$//e" })

-- Restore last cursor position when reopening a file
augroup("LastCursorGroup", { clear = true })
autocmd("BufReadPost", {
  group = "LastCursorGroup",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

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
