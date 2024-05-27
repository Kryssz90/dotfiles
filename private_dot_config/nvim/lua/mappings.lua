require "nvchad.mappings"

-- add yours here

local nomap = vim.keymap.del
-- nomap("n", "<leader>sh")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

map("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)


map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>sv", ":vsp<CR>", { desc = "Split vertical", noremap = false })
map("n", "<leader>sh", ":sp<CR>", { desc = "Split horizontal", noremap = false })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close window" })


map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer", noremap = false })

map("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find text" })
map("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find text in current buffer" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Open recent files" })
