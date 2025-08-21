local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.clipboard:append("unnamedplus")

set.termguicolors = true

set.cursorline = true
set.scrolloff = 8

set.splitright = true
set.splitbelow = true

set.mouse:append("a")
set.iskeyword:append("-")
set.backspace = "indent,eol,start"

set.wrap = false
set.showbreak = "↳"

set.winborder = "rounded"
