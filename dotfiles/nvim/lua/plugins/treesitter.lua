-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     event = "BufReadPost",
--     config = function()
--         require("nvim-treesitter").setup({
--             ensure_installed = {
--                 "php",
--                 "c",
--                 "cpp",
--                 "python",
--                 "javascript",
--                 "html",
--                 "bash",
--                 "lua",
--                 "json",
--                 "css",
--                 "typescript",
--                 "tsx",
--                 "jsx",
--                 "markdown",
--                 "markdown_inline",
--                 "yaml",
--                 "toml",
--                 "sql",
--                 "dockerfile",
--                 "gitignore",
--                 "vim",
--                 "vimdoc",
--                 "query",
--             },
--             highlight = { enable = true },
--         })
--     end,
-- }
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
        local ensure_installed = {
            "c", "cpp", "python", "javascript", "html", "bash", "lua",
            "json", "css", "typescript", "tsx", "jsx", "markdown",
            "markdown_inline", "yaml", "toml", "sql", "dockerfile",
            "gitignore", "vim", "vimdoc", "query",
            "php",   -- ← agregado
        }

        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(ensure_installed)

        -- Activa highlighting automáticamente al abrir cualquier
        -- archivo cuyo lenguaje tenga parser disponible
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang and vim.treesitter.language.add(lang) then
                    vim.treesitter.start()
                end
            end,
        })
    end,
}
