return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Configuración compartida (Asegura compatibilidad nativa con blink.cmp)
        vim.lsp.config('*', {
            -- blink.cmp detecta de forma automática las capacidades, no necesitas nvim-cmp
        })

        -- PHP
        vim.lsp.config('intelephense', {})

        -- Python
        vim.lsp.config('pyright', {})

        -- C/C++
        vim.lsp.config('clangd', {})

        -- Lua (evita el aviso de que 'vim' no está definido)
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        -- Emmet Server
        vim.lsp.config('emmet_language_server', {
            -- SOLUCIÓN: Forzamos a lspconfig a usar el binario 'emmet-ls' que instalaste por npm
            cmd = { "emmet-ls", "--stdio" },
            filetypes = { "php", "html", "css", "javascript", "javascriptreact", "typescriptreact" },
            init_options = {
                showSuggestionsAsSnippets = true, -- esto es la clave
            },
        })

        -- Habilitar todos los servidores
        vim.lsp.enable({ 'intelephense', 'pyright', 'clangd', 'lua_ls', 'emmet_language_server' })
    end,
}
