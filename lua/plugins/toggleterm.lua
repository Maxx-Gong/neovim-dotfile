return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm').setup {
                open_mapping = [[<c-\>]],
                start_in_insert = true,
                direction = 'float', -- | 'vertical' | 'horizontal' | 'tab' | 'float' |
                shell = 'pwsh -Nologo',
                float_opts = {
                    -- The border key is *almost* the same as 'nvim_open_win'
                    -- see :h nvim_open_win for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    border = 'curved', -- | 'single'| 'double' | 'shadow' | 'curved' | ... --other options supported by win open
                    -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                    width = 100,
                    -- height = <value>,
                    -- row = <value>,
                    -- col = <value>,
                    -- winblend = 3,
                },
            }
        end
    }
}
