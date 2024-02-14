local set = vim.opt

-- Tab / Indentation
set.smartindent = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.shiftround = false

set.wrap = false
vim.cmd[[au BufRead,BufNewFile *.md,*.txt setlocal wrap linebreak nolist]]

-- Serach
set.hlsearch = true
set.incsearch = true
set.smartcase = true
set.ignorecase = true

-- Appearance
set.number = true
set.relativenumber = true
set.termguicolors = true
set.cursorline = true
set.scrolloff = 8

set.list = false
vim.cmd[[set lcs=tab:\|\ ,space:·,precedes:«,extends:»]]

-- Temporary Files
set.swapfile = false
set.backup = false
set.undodir = vim.fn.expand("~/.nvim/undodir")
set.undofile = true

-- Behaviour
set.hidden = true
set.errorbells = false
set.backspace = "indent,eol,start"
set.splitright = true
set.splitbelow = true
set.autochdir = false
set.iskeyword:append("-")
set.mouse:append('a')
set.clipboard = 'unnamedplus'
set.modifiable = true
set.encoding = "UTF-8"

-- Remove inser mode commands delay
vim.cmd[[au InsertEnter * set timeoutlen=250]]
vim.cmd[[au InsertLeave * set timeoutlen=1000]]

-- Restore the last cursor position
vim.cmd[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- Automatically delete all trailing whitespace on save
vim.cmd[[au BufWritePre * %s/\s\+$//e]]

