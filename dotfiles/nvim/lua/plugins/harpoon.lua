return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", desc = "Arponear archivo" },
        { "<leader>h", desc = "Menú Harpoon" },
        { "<leader>1" },
        { "<leader>2" },
        { "<leader>3" },
        { "<leader>4" },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- 1. MARCAR ARCHIVO: <leader>a
        -- Le ponemos desc = nil o simplemente no lo registramos en wk para que sea discreto
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
            print("󰛢 Arponeado: " .. vim.fn.expand("%:t"))
        end, { desc = "Arponear archivo" })

        -- 2. MENÚ VISUAL: <leader>h (Único que verás en Which-Key)
        vim.keymap.set("n", "<leader>h", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Menú Harpoon" })

        -- 3. NAVEGACIÓN SILENCIOSA (1-4)
        -- Al no ponerles "desc", Which-Key normalmente no los muestra.
        -- Para estar 100% seguros de que no aparezcan, usamos la opción 'hidden = true' si tu versión lo soporta,
        -- o simplemente los definimos sin descripción.
        for i = 1, 4 do
            vim.keymap.set("n", "<leader>" .. i, function()
                harpoon:list():select(i)
            end, { silent = true })
        end
    end,
}
