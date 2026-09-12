return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion: Toggle Chat", mode = { "n", "v" } },
    { "<leader>ce", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion: Inline Action", mode = { "n", "v" } },
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
      chat = {
        render_headers = true,
        show_settings = true,
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
}
