return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
}
