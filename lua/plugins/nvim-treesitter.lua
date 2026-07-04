return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = "VeryLazy",
        cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup()

            -- Make sure all we need has been installed.
            local ensure_installed = {
                "lua", "vim",                   -- neovim language
                "c", "cpp", "rust", "python",   -- computing language
                "html",                         -- website language
                "make", "cmake", "toml", "json" -- config language
            }
            local pattern = {}
            for _, parser in ipairs(ensure_installed) do
                local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)

                if not has_parser then
                    treesitter.install(parser)
                else
                    -- Make sure installed before highlight functions.
                    pattern = vim.tbl_extend("keep", pattern, vim.treesitter.language.get_filetypes(parser))
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = pattern,
                callback = function()
                    vim.treesitter.start()
                end,
            })
            -- VeryLazy is later than FileType, trigger it explicitly.
            vim.api.nvim_exec_autocmds("FileType", {})
        end,
    }
}
