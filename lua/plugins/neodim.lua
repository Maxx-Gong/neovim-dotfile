return {
	{
	    "zbirenbaum/neodim",
	    event = "LspAttach",
        opts = {
            alpha = 0.75,
            blend_color = "#000000",
            hide = {
                virtual_text = true,
                signs = true,
                underline = true,
            },
            regex = {
              "[uU]nused",
              "[nN]ever [rR]ead",
              "[nN]ot [rR]ead",
            },
            priority = 128,
            disable = {},
        }
	}
}
