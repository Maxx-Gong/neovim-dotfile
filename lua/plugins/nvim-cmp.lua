return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- For vsnip
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            -- For latex_symbols
            "kdheepak/cmp-latex-symbols",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require('lspkind')

            cmp.setup {
                snippet = {
                    -- Use vsnip
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    completion = { border = 'rounded' },
                    documentation = { border = 'rounded'} ,
                },
                mapping = cmp.mapping.preset.insert({
                    -- [KEY_BINDING]
                    ['<M-Enter>'] = cmp.mapping.complete(), -- Display
                    ['<M-e>'] = cmp.mapping.abort(), -- Cancel
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'vsnip' },
                    { name = 'path' },
                    { name = "latex_symbols" },
                    { name = 'buffer' },
                }),
                formatting = {
                    fields = { 'abbr', 'icon', 'kind', 'menu' },
                    format = lspkind.cmp_format({
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
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
