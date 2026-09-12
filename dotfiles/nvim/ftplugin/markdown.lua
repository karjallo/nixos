local opts = { buffer = true, silent = true }

-- vim.keymap.set("n", "<leader>zn", ":ZkNew<CR>",       { buffer = true, silent = true, desc = "Nueva nota" })
vim.keymap.set("n", "<leader>zf", ":ZkNotes<CR>",     { buffer = true, silent = true, desc = "Buscar notas" })
vim.keymap.set("n", "<leader>zt", ":ZkTags<CR>",      { buffer = true, silent = true, desc = "Buscar tags" })
vim.keymap.set("n", "<leader>zb", ":ZkBacklinks<CR>", { buffer = true, silent = true, desc = "Backlinks" })
vim.keymap.set("n", "<leader>zl", ":ZkLinks<CR>",     { buffer = true, silent = true, desc = "Links" })
vim.keymap.set("n", "<leader>zm", ":ZkMatch<CR>",     { buffer = true, silent = true, desc = "Buscar contenido" })
vim.keymap.set("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true, silent = true, desc = "Seguir link" })
