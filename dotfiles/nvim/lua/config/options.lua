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

-- Configuración de límites y corte de línea
vim.opt.wrap = true          -- Habilita el salto de línea visual
vim.opt.linebreak = true     -- Evita que las palabras se corten a la mitad
vim.opt.textwidth = 80       -- Corta físicamente al escribir (principalmente comentarios/markdown)
-- ESTA ES LA LÍNEA CRUCIAL PARA LAZYVIM:
vim.opt.formatoptions:remove({ "t" }) -- Evita que LazyVim rompa el wrapping visual en ciertos archivos

-- Default global
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Desactivar providers heredados que no se utilizan
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- autocompletar sugerencias wilf menu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full" -- primero completa lo común, luego cicla

-- visualizacion de panes
vim.opt.fillchars = {
    vert = '│',
    horiz = '─',    -- separador horizontal
    horizup = '┴',  -- intersecciones
    horizdown = '┬',
    vertleft = '┤',
    vertright = '├',
    verthoriz = '┼',
}

vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#888888', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#888888', bg = 'NONE' })
