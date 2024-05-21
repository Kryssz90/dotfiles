require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true}


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
