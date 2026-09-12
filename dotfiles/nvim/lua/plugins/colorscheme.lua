return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
            },
            color_overrides = {
                mocha = {
                    pink = "#F3005F",    -- Fucsia Monokai
                    mauve = "#9C64FE",   -- Púrpura Monokai
                    green = "#97E023",   -- Verde neón
                    yellow = "#FA8419",  -- Naranja Monokai
                    cyan = "#57D1EA",    -- Cian Monokai
                },
            },
            integrations = {
                blink_cmp = true,
                treesitter = true,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
