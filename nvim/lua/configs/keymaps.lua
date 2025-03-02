-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

local props = { noremap = true, silent = true }

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

keymap.set("v", "<leader>n", ":w !node<CR>", props)

-- vim.keymap.set("n", "<leader><leader>p", vim.lsp.buf.format, props)
vim.keymap.set("n", "<leader><leader>p", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", props)

local augroup = vim.api.nvim_create_augroup
local test = augroup("test", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("LspAttach", {
	group = test,
	callback = function(e)
		local opts = { buffer = e.buf }
		keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		keymap.set("n", "<leader>K", function()
			vim.lsp.buf.hover()
		end, opts)
		keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		keymap.set("n", "gl", function()
			vim.diagnostic.open_float()
		end, opts)
	end,
})
