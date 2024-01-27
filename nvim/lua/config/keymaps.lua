-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

local props = { noremap = true, silent = true }

-- Map Escape
keymap.set('i', 'jj', '<Esc>', props)

-- hlsearch Clear
keymap.set('n', '<leader>n', ':noh<CR>', props)

-- Buffer shortcuts
keymap.set('n', '<leader>w', ':w!<CR>', props)
keymap.set('n', '<leader>qq', ':bd<CR>', props)
keymap.set('n', '<leader>qa', ':bufdo bd<CR>', props)
keymap.set('n', '<leader>l', ':bnex<CR>', props)
keymap.set('n', '<leader>h', ':bprevious<CR>', props)

-- Immediately add a closing quotes or braces in insert mode
keymap.set('i', "'", "''<esc>i", props)
keymap.set('i', '"', '""<esc>i', props)
keymap.set('i', '`', '``<esc>i', props)
keymap.set('i', '(', '()<esc>i', props)
keymap.set('i', '{', '{}<esc>i', props)
keymap.set('i', '[', '[]<esc>i', props)

-- Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
keymap.set('n', '<c-h>', '<c-w><c-h>', props)
keymap.set('n', '<c-j>', '<c-w><c-j>', props)
keymap.set('n', '<c-k>', '<c-w><c-k>', props)
keymap.set('n', '<c-l>', '<c-w><c-l>', props)

-- Moving lines
keymap.set('n', '<S-j>', ':m .+1<CR>==', props)
keymap.set('n', '<S-k>', ':m .-2<CR>==', props)
keymap.set('v', '<S-j>', ":m '>+1<CR>gv=gv", props)
keymap.set('v', '<S-k>', ":m '<-2<CR>gv=gv", props)

-- Split Window
keymap.set('n', '<leader>sv', ':vsplit<CR>', props)
keymap.set('n', '<leader>sh', ':split<CR>', props)
keymap.set('n', '<leader>sc', '<c-w>o', props)
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', props)

-- <Tab> / <Tab-Backwards>
keymap.set("n", "<Tab>", ">>", props)
keymap.set("n", "<S-Tab>", "<<", props)
keymap.set("i", "<S-Tab>", "<C-d>", props)
keymap.set("v", "<Tab>", ">gv", props)
keymap.set("v", "<S-Tab>", "<gv", props)
keymap.set("x", "<Tab>", ">gv", props)
keymap.set("x", "<S-Tab>", "<gv", props)
keymap.set("s", "<Tab>", "<C-o>>gv<C-g>", props)
keymap.set("x", "<S-Tab>", "<C-o><gv<C-g>", props)