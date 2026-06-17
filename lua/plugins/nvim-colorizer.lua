return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function ()
            -- One line setup. This will create an autocmd for FileType * to highlight every filetype.
            require('colorizer').setup()
        end
    }
}
