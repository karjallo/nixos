return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    -- event = "VeryLazy",
    -- version = "main",
    config = function()
        require("screenkey").setup({
            -- win_opts = {
            --     width = 30,
            --     height = 1,
            -- },
            show_leader = true,
            group_mappings = true,
            disable = {
                buftypes = { "terminal" },
            },
        })
        -- vim.cmd("Screenkey")  -- UI
        vim.cmd("Screenkey toggle_statusline_component")
    end,
}
