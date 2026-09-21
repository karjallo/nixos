return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "j-hui/fidget.nvim"
    },
    keys = {
        { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion: Toggle Chat", mode = { "n", "v" } },
        { "<leader>ci", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion: Inline Action", mode = { "n", "v" } },
        -- limpiar ui
        {
            "<leader>cl",
            "<cmd>nohlsearch | lua vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)<cr>",
            desc = "CodeCompanion: Clear ghost UI / highlights",
            mode = { "n" },
        },
        -- launcher de code companion actions
        {
            "<leader>cp",
            "<cmd>CodeCompanionActions<cr>",
            desc = "CodeCompanion: Action Palette",
            mode = { "n", "v" },
        },
        -- autocompletado
        {
            "<leader>ca",
            "<cmd>CodeCompanion #{buffer}{all} Complete the function or class where my cursor is located. Only write the missing implementation, keep the existing signature.<cr>",
            desc = "CodeCompanion: Auto-complete (buffer completo)",
            mode = { "n", "v" },
        },


    },
    opts = {
        strategies = {
            chat = { adapter = "ollama" },
            inline = { adapter = "ollama" },
        },
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    schema = {
                        model = { default = "qwen2.5-coder:7b" },
                        num_ctx = { default = 8192 },
                    },
                })
            end,
        },
        display = {
            action_palette = {
                width = 95,
                height = 10,
                prompt = "Prompt ", -- Prompt used for interactive LLM calls
                provider = "snacks", --"default", "telescope", "fzf_lua", "mini_pick", "snacks"
                opts = {
                    show_preset_actions = true, -- Show the preset actions in the action palette?
                    show_preset_prompts = true, -- Show the preset prompts in the action palette?
                    title = "CodeCompanion actions", -- The title of the action palette

                },
            },
            chat = {
                render_headers = true,
                show_settings = false,
                show_context = false,
                fold_content = true,
                icons = {
                    chat_context = "📎", -- opcional: icono para el fold plegado
                },
                window = {
                    layout = "vertical",
                    position = "right",
                    width = 0.4,
                },
            },
        },
        interactions = {
            chat = {
                opts = {
                    system_prompt = function()
                        local Path = require("plenary.path")
                        local rule_path = Path:new(vim.fn.expand("~/.config/nvim/rules/caveman.md"))
                        if rule_path:exists() then
                            return rule_path:read()
                        end
                        return "Respond concisely."
                    end,
                },
            },
        },
        rules = {
            caveman = {
                description = "Caveman terse style for all chats",
                files = {
                    "~/.config/nvim/rules/caveman.md",
                },
            },
            opts = {
                chat = {
                    autoload = "caveman",
                    enabled = true,
                },
            },
        },
    },
    init = function()
        require("plugins.codecompanion.fidget-spinner"):init()
    end,
}
