return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-t>]],  -- Ctrl+t abre/cierra
            insert_mappings = false,
            direction = "float",        -- float | horizontal | vertical
            float_opts = {
                border = "rounded",
            },
        })
    end,
}
