return {
    "saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = {
            preset = "none",
            ["<C-j>"] = {
                function(cmp)
                    if cmp.is_visible() then return cmp.select_next() end
                end,
                "fallback",
            },
            ["<C-k>"] = {
                function(cmp)
                    if cmp.is_visible() then return cmp.select_prev() end
                end,
                "fallback",
            },
            ["<C-l>"] = { "accept", "fallback" },
            ["<C-e>"] = { "hide" },
            ["<C-space>"] = { "show" },
            ["<C-Down>"] = {"scroll_documentation_down"},
            ["<C-Up>"] = {"scroll_documentation_up"},
        },
        cmdline = {
            keymap = {
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-l>"] = { "accept", "fallback" },
            },
            sources = { "cmdline" },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        completion = {
            accept = { auto_brackets = { enabled = false } },
            menu = { border = "rounded" },
            documentation = {
                auto_show = true,
                window = { border = "rounded" },
            },
        },
        appearance = {
            kind_icons = {
                Function  = "󰊕",
                Variable  = "󰀫",
                Class     = "󰠱",
                Module    = "",
                Snippet   = "",
            },
        },
    },
}
