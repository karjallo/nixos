return {
    {
        'echasnovski/mini.surround',
        version = false,
        event = "BufReadPost",
        config = function()
            require('mini.surround').setup({
                mappings = {
                    add            = "sa",
                    delete         = "sd",
                    replace        = "sr",
                    find           = "sf",
                    find_left      = "sF",
                    highlight      = "sh",
                    update_n_lines = "sn",
                },
            })
        end,
    },
    {
        'echasnovski/mini.ai',
        version = false,
        -- event = "BufReadPost",
        config = function()
            require('mini.ai').setup({
                search_method = 'cover_or_next'
            })
        end,
    },
}
