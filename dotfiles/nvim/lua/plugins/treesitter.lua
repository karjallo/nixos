return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "c", "cpp", "python", "javascript", "html", "bash", "lua", "json",
            "css",
            "typescript",
            "tsx",
            "jsx",
            "markdown",
            "markdown_inline",
            "yaml",
            "toml",
            "sql",
            "dockerfile",
            "gitignore",
            "vim",
            "vimdoc",
            "query",
        },
        highlight = { enable = true },
    })
end,
}
