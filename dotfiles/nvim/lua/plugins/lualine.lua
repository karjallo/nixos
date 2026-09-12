return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Para ver los iconos de archivos
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto', -- Se adapta automáticamente a tu colorscheme
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {
                    function()
                        local status = require("screenkey").get_keys()
                        return status:gsub("%%", "%%%%")
                    end,
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        })
    end,
}

