return {
    "folke/snacks.nvim",
    dependencies = {
        "echasnovski/mini.icons",
    },
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            size = 1.5 * 1024 * 1024,
        },
        notifier = {
            enabled = true,
            style = "compact",   -- "fancy" | "compact" | "minimal"
            timeout = 5000,    -- duración en ms
            top_down = true,  -- las notificaciones aparecen desde abajo
        },
    },
}
