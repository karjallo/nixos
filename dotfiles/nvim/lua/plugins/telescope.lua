return
{
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader>ff', '<CMD>Telescope find_files<CR>', desc = 'Files'},
        {'<leader>fh', '<CMD>Telescope help_tags<CR>',  desc = 'Help'},
        {'<leader>fG', '<CMD>Telescope live_grep<CR>',  desc = 'Grep'},
        {'<leader>fb', '<CMD>Telescope buffers<CR>',    desc = 'Buffers'},
        {'<leader>fk', '<CMD>Telescope keymaps<CR>',    desc = 'Keymaps'},
        {'<leader>fg', '<CMD>Telescope git_files<CR>',  desc = 'Git files'},
    },
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
            }
        })
    end
}
