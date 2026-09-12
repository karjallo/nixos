return {
    "zk-org/zk-nvim",
    ft = { "markdown" },
    keys = {
        {
            "<leader>zn",
            function()
                vim.ui.input({ prompt = "Título: " }, function(title)
                    if title then
                        require("zk.commands").get("ZkNew")({ title = title })
                    end
                end)
            end,
            desc = "New Note"
        },
    },
    config = function()
        require("zk").setup({
            picker = "telescope",
            lsp = {
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                },
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdown" },
                },
            },
        })
    end,
}
