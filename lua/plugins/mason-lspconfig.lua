return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pylsp",
                "rust_analyzer"
            }
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig"
        },
    }
}
