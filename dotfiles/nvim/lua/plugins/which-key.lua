return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300 -- El menú aparece tras 300ms
    end,
    opts = {
        -- Configuración de visualización
        preset = "helix",
        delay = 1000,
        spec = {
            -- Aquí puedes "esconder" los números del 1 al 4
            -- para que no aparezcan en el menú al presionar <leader>
            { "<leader>1", hidden = true },
            { "<leader>2", hidden = true },
            { "<leader>3", hidden = true },
            { "<leader>4", hidden = true },

            -- También puedes agrupar tus otros plugins para que se vea ordenado
            { "<leader>f", group = "Files (Telescope)" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Harpoon menu" },
            { "<leader>t", group = "Toggle Terminal" },
            { "<leader>d", group = "Diagnostics" },
            { "<leader>p", group = "Panes" },
        },
        win = {
            -- Si prefieres que el menú no sea una franja gigante abajo
            border = "rounded",
            padding = { 0, 1 },
        },
    },
}
