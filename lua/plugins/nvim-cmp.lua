return {
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "neovim/nvim-lspconfig",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	    "hrsh7th/cmp-vsnip",
	    "hrsh7th/vim-vsnip",
	    "kdheepak/cmp-latex-symbols",
	    "lukas-reineke/cmp-under-comparator",
	},
	config = function()
	    local cmp = require("cmp")
	    local lspkind = require('lspkind')
	    cmp.setup
	    {
		snippet = {
		    -- REQUIRED - you must specify a snippet engine
		    expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		    end,
		},
		window = {
		    completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered(),
		},
		sorting = {
		    comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require "cmp-under-comparator".under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		    },
		},
		mapping = cmp.mapping.preset.insert({
		    -- 上一个
		    ['<C-k>'] = cmp.mapping.select_prev_item(),
		    -- 下一个
		    ['<C-j>'] = cmp.mapping.select_next_item(),
		    -- 出现补全
		    ['<C-Space'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		    -- 取消
		    ['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		    }),
		    -- 确认
		    ['<CR>'] = cmp.mapping.confirm({
			select = true ,
			behavior = cmp.ConfirmBehavior.Replace
		    }),
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'nvim_lua' },
		    { name = 'vsnip' }, -- For vsnip users.
		    { name = 'buffer' },
		    {
			name = "latex_symbols",
			option = {
			    strategy = 0, -- mixed
			},
		    },
		}),
		formatting = {
		    format = lspkind.cmp_format({
			with_text = true, -- do not show text alongside icons
			maxwidth = 50,
			before = function (entry, vim_item)
			    vim_item.menu = "["..string.upper(entry.source.name).."]"
			    return vim_item
			end
		    })
		},
	    }

	    cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
		    { name = 'git'},
		}, {
		    { name = 'buffer' },
		})
	    })
	    -- Use buffer source for `/`.
	    cmp.setup.cmdline('/', {
		sources = {
		    { name = 'buffer' }
		}
	    })

	    -- Use cmdline & path source for ':'.
	    cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
		    { name = 'path' }
		}, {
		    { name = 'cmdline' }
		})
	    })
	end
    }
}
