-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- mini.surround conflict
-- vim.keymap.set("n", "s", "cl", { noremap = true })
-- Oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil" })
-- Ver el error actual en una ventana flotante
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = "Ver error flotante" })
-- Ver todos los errores del archivo en una lista (Quickfix)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = "Lista de diagnósticos" })
-- Saltar al error anterior/siguiente
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Error anterior" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Error siguiente" })
-- saltar y centrar
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Navegar entre panes con Ctrl-hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-q>', '<C-w>q')
vim.keymap.set('n', '<leader>pv', ':vsp<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>ph', ':sp<CR>', { desc = 'Split horizontal' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', {desc = 'Open new tab'})
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', {desc = 'Close current tab'})
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', {desc = 'Next tab'})
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', {desc = 'Previous tab'})

-- escape hace :noh en normal mode, borrando search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
-- vim motions
vim.keymap.set('n', '<leader>?', function()
    local lines = vim.fn.readfile(vim.fn.expand('~/.config/nvim/vim-motions.txt'))
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    local width = 56
    local height = math.min(#lines, vim.o.lines - 4)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = 'minimal',
        border = 'rounded',
    })
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf })
end, { desc = 'Cheatsheet' })

