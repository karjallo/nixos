-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- undo file
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
--
vim.opt.title = true
-- Opciones básicas
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300
-- splits
vim.opt.splitright = true
-- Configuración de límites y corte de línea
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
-- ESTA ES LA LÍNEA C
vim.opt.formatoptions:remove({ "t" })

-- Default global
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false

-- Desactivar providers heredados que no se utilizan
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- autocompletar sugerencias wilf menu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- visualizacion de panes
vim.opt.fillchars = {
    vert = '│',
    horiz = '─',
    horizup = '┴',
    horizdown = '┬',
    vertleft = '┤',
    vertright = '├',
    verthoriz = '┼',
}

vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#888888', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#888888', bg = 'NONE' })
