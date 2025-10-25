-- Standard VIM key bindings

-- Set the Leader key
vim.g.mapleader = MAPLEADER
vim.g.maplocalleader = MAPLOCALLEADER

-- Move current line down with Alt-j
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move current line up with Alt-k
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Map key for ToggleTerm
-- This may not be the most logical place to define this but here it is...
vim.keymap.set("n", TOGGLETERM_KEY or "<C-_>", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("t", TOGGLETERM_KEY or "<C-_>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
