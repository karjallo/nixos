return {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" }, -- Carga el plugin solo cuando se necesita
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            php = {"phpstan"},
            python = { "pylint" },
            javascript = { "eslint" },
            typescript = { "eslint" },
            lua = { "luacheck" },
            c = { "cppcheck" },
            cpp = { "cppcheck" },
        }

        -- Crear un grupo para evitar duplicados si recargas la config
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                -- Intentar ejecutar el linter de forma segura
                lint.try_lint(nil, { ignore_errors = true })
            end,
        })
    end,
}
