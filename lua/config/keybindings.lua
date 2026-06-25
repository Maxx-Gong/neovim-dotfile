vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local del = vim.keymap.del

-- Move
map("n", "<c-k>", "15k", { desc = "Move 15 up" })
map("n", "<c-j>", "15j", { desc = "Move 15 down" })

-- Buffer
map("n", "s", "", { desc = "Cancel normal function" })

map("n", "s>", ":vsp<CR>", { desc = "Split buffer to the right" })
map("n", "s^", ":sp<CR>",  { desc = "Split buffer to the top" })

map("n", "sc", "<C-w>c", { desc = "Close current buffer" })
map("n", "so", "<C-w>o", { desc = "Close others" })

map("n", "s=", ":vertical resize +20<CR>", { desc = "Expand buffer width" })
map("n", "s-", ":vertical resize -20<CR>", { desc = "Reduce buffer width" })
map("n", "sj", ":resize +10<CR>", { desc = "Expand buffer height" })
map("n", "sk", ":resize -10<CR>", { desc = "Reduce buffer height" })

map("n", "<A-h>", "<C-w>h", { desc = "Focus left"  })
map("n", "<A-j>", "<C-w>j", { desc = "Focus down"  })
map("n", "<A-k>", "<C-w>k", { desc = "Focus up"    })
map("n", "<A-l>", "<C-w>l", { desc = "Focus right" })

-- Lazy
map("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy" })

-- Mason
map("n", "<leader>m", ":Mason<CR>", { desc = "Open Mason" })

-- Telescope
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>g", ":Telescope live_grep<CR>",  { desc = "Find codes" })

-- Tree
map('n', "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open tree" })

-- Diffview
map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close Diffview" })
map("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "Open Diffview history" })
map("n", "<leader>dl", ":DiffviewLog<CR>", { desc = "Open Diffview log" })

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local bufnr = args.buf

        map('n', 'gd', vim.lsp.buf.definition, { buf = bufnr, desc = "Goto definition" })
        map('n', 'gt', vim.lsp.buf.type_definition, { buf = bufnr, desc = "Goto type definition" })
        map('n', 'gh', vim.lsp.buf.hover, { buf = bufnr, desc = "Goto hover" })
        map('n', 'gD', vim.lsp.buf.declaration, { buf = bufnr, desc = "Goto declaration" })
        map('n', 'gi', vim.lsp.buf.implementation, { buf = bufnr, desc = "Goto implementation" })
        map("n", "<leader>=", vim.lsp.buf.format, { buf = bufnr, desc = "Format" })
        -- diagnostic
        --map('n', 'go', vim.diagnostic.open_float, { buf = bufnr, desc = "" })
        --map('n', 'gp', vim.diagnostic.goto_prev, { buf = bufnr, desc = "" })
        --map('n', 'gn', vim.diagnostic.goto_next, { buf = bufnr, desc = "" })
        --map('n', '<leader>q', vim.diagnostic.setloclist, { buf = bufnr, desc = "" })
    end,
})
