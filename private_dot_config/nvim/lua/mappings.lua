require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true}


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
