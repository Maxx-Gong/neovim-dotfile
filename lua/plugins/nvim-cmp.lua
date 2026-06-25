return {
    {
        "hrsh7th/nvim-cmp",
        -- Load cmp on InsertEnter
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- For latex_symbols
            "kdheepak/cmp-latex-symbols",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require('lspkind')

            cmp.setup {
                window = {
                    completion = { border = 'rounded', },
                    documentation = { border = 'rounded', },
                },
                -- [KEY_BINDING]
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    {
                        name = "latex_symbols",
                        option = {
                            strategy = 0, -- mixed
                        },
                    },
                    { name = 'buffer' },
                }),
                formatting = {
                    fields = { 'abbr', 'icon', 'kind', 'menu' },
                    format = lspkind.cmp_format({
                        menu = ({
                            buffer =        "[Buffer]",
                            nvim_lsp =      "[LSP]",
                            nvim_lua =      "[Lua]",
                            latex_symbols = "[Latex]",
                        }),
                        maxwidth = {
                          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                          -- can also be a function to dynamically calculate max width such as
                          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                          abbr = 30, -- actual suggestion item
                          menu = 20, -- leading text (labelDetails)
                        },
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, vim_item)
                          -- ...
                          return vim_item
                        end
                    })
                }
            }

            -- Use buffer source for `/`.
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':'.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                  { name = 'path' }
                }, {
                  { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            vim.lsp.config('<YOUR_LSP_SERVER>', {
              capabilities = capabilities
            })
            vim.lsp.enable('<YOUR_LSP_SERVER>')
        end
    }
}
