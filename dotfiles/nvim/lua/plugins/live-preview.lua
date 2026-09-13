return {
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("livepreview").setup({
            port = 5500,
            browser = "surf", -- o "chromium", "brave", etc.
        })
        vim.keymap.set("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Live Preview" })
        vim.keymap.set("n", "<leader>ls", ":LivePreview close<CR>", { desc = "Stop Preview" })
    end,
}
