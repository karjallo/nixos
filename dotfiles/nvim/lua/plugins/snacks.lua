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
            style = "compact",
            timeout = 5000,
            top_down = true,
        },
        picker = {
            enabled = true,
            ui_select = true,
        },
    },
}
