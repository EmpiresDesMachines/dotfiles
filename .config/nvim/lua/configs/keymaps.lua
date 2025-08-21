-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

local props = { noremap = true, silent = true }

-- Reload configuration without restart nvim
keymap.set("n", "<leader>rc", ":so %<CR>", props)

-- Map Escape
keymap.set("i", "jj", "<Esc>", props)

-- hlsearch Clear
-- keymap.set("n", "<leader>n", ":noh<CR>", props)

-- Buffer shortcuts
keymap.set("n", "<leader>w", ":w!<CR>", props)
keymap.set("n", "<leader>qq", ":bd<CR>", props)
keymap.set("n", "<leader>qa", ":bufdo bd<CR>", props)
keymap.set("n", "<leader>l", ":bnex<CR>", props)
keymap.set("n", "<leader>h", ":bprevious<CR>", props)

-- Immediately add a closing quotes or braces in insert mode
-- keymap.set("i", "'", "''<esc>i", props)
-- keymap.set("i", '"', '""<esc>i', props)
-- keymap.set("i", "`", "``<esc>i", props)
-- keymap.set("i", "(", "()<esc>i", props)
-- keymap.set("i", "{", "{}<esc>i", props)
-- keymap.set("i", "[", "[]<esc>i", props)

-- Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
keymap.set("n", "<c-h>", "<c-w><c-h>", props)
keymap.set("n", "<c-j>", "<c-w><c-j>", props)
keymap.set("n", "<c-k>", "<c-w><c-k>", props)
keymap.set("n", "<c-l>", "<c-w><c-l>", props)

-- Change split orientation
keymap.set("n", "<leader>tk", "<C-w>t<C-w>K", props) -- change vertical to horizontal
keymap.set("n", "<leader>th", "<C-w>t<C-w>H", props) -- change horizontal to vertical

-- Moving lines
keymap.set("n", "<S-j>", ":m .+1<CR>==", props)
keymap.set("n", "<S-k>", ":m .-2<CR>==", props)
keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", props)
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", props)

-- Move to first symbol on the line
vim.keymap.set("n", "<S-h>", "^", props)

-- Move to last symbol of the line
vim.keymap.set("n", "<S-l>", "$", props)

-- Split Window
keymap.set("n", "<leader>sv", ":vsplit<CR>", props)
keymap.set("n", "<leader>sh", ":split<CR>", props)
keymap.set("n", "<leader>sc", "<c-w>c", props)
-- keymap.set("n", "<leader>sc", "<c-w>o", props)
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", props)

-- <Tab> / <Tab-Backwards>
keymap.set("n", "<Tab>", ">>", props)
keymap.set("n", "<S-Tab>", "<<", props)
keymap.set("i", "<S-Tab>", "<C-d>", props)
keymap.set("v", "<Tab>", ">gv", props)
keymap.set("v", "<S-Tab>", "<gv", props)
keymap.set("x", "<Tab>", ">gv", props)
keymap.set("x", "<S-Tab>", "<gv", props)
keymap.set("s", "<Tab>", "<C-o>>gv<C-g>", props)
keymap.set("s", "<S-Tab>", "<C-o><gv<C-g>", props)

-- vim.keymap.set("n", "<leader><leader>p", vim.lsp.buf.format, props)
vim.keymap.set("n", "<leader><leader>p", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", props)

-- Paste last thing yanked, not deleted
vim.keymap.set("n", "<leader>p", '"0p<CR>', props)
vim.keymap.set("n", "<leader>P", '"0P<CR>', props)
