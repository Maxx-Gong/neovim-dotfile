-- KEYMAPS
-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

local map = vim.keymap.set
local del = vim.keymap.del

-- Move
map("n", "<c-k>", "15k", { desc = "Move 15 up" })
map("n", "<c-j>", "15j", { desc = "Move 15 down" })

-- Buffer
map("n", "<A-h>", "<C-w>h", { desc = "Focus left"  })
map("n", "<A-j>", "<C-w>j", { desc = "Focus down"  })
map("n", "<A-k>", "<C-w>k", { desc = "Focus up"    })
map("n", "<A-l>", "<C-w>l", { desc = "Focus right" })

map("n", "<C-w>=", "5<C-w>+", { desc = "Increase buffer height" })
map("n", "<C-w>-", "5<C-w>-", { desc = "Decrease buffer height" })
map("n", "<C-w>.", "5<C-w>>", { desc = "Increase buffer height" })
map("n", "<C-w>,", "5<C-w><", { desc = "Decrease buffer height" })

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
