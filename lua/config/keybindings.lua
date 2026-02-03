vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- move quicker
map("n", "<c-k>", "15k", opt)
map("n", "<c-j>", "15j", opt)

-- split
map("n", "s", "", opt) -- cancel the normal function 
map("n", "s>", ":vsp<CR>", opt)
map("n", "s^", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt) -- close now
map("n", "so", "<C-w>o", opt) -- close others

map("n", "s+", ":vertical resize +20<CR>", opt)
map("n", "s-", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>",opt)
map("n", "sk", ":resize -10<CR>",opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- Lazy
map("n", "<leader>l", ":Lazy<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

-- local plugin_keys = {}
-- plugin_keys.toggleterm {
--     open_mapping = [[<c-\>]],
-- }
--
-- require("plugins.toggleterm").setup {
--     open_mapping = [[<c-\>]],
-- }
